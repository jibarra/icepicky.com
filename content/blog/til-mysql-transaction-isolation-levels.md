---
title: "TIL: MySQL Transaction Isolation Levels"
date: 2023-08-21T16:00:23-06:00
draft: false
tags:
- til
---

Today I learned about MySQL transaction isolation levels.

I was trying to debug issues where concurrent processes didn't seem to be locking rows in the database correctly. A simplified version of the offending code could look something like this (comments added for those unfamiliar with Rails):

```ruby
# Reader: Assume the record we're processing is not processed
# Query for the row with ID 123 for table some_active_record_classes
some_active_record_class = SomeActiveRecordClass.where(id: 123).first

ActiveRecord::Base.transaction do # Open a database transaction
  # Query for associated data from another table processed_items
  processed_items = ProcessedItem.where(foreign_key: some_active_record_class.id)

  # Lock the row with ID 123
  some_active_record_class.lock!

  # Requery the database for ID 123 to ensure we have the most up to date data after locking
  some_active_record_class.reload!

  # Early exit if the record is processed
  return if some_active_record_class.processed == true

  # Simulate long running logic by waiting for 5 seconds
  sleep(5)

  # Update the DB 
  some_active_record_class.update!(processed: true, processed_count: processed_items.size)
end # Release the lock, commit, and close the transaction
```

When running that code concurrently, you'd expect that only one process would do the updates and the other process(es) would exit immediately after grabbing the lock. However, we were seeing that all processes would update the database. Originally we thought the problem was that we weren't opening a lock at all or we weren't opening the lock correctly. We were correct on one point of the hypothesis: we were opening a lock but the logic to open it was incorrect.

It turns out that MySQL uses [transaction isolation levels](https://dev.mysql.com/doc/refman/8.0/en/innodb-transaction-isolation-levels.html) to ensure reads to the database are consistent for a transaction. By default, InnoDB in MySQL uses `REPEATABLE READ` as the isolation level. `REPEATABLE READ` [will ensure all queries within a transaction are repeatable](https://dev.mysql.com/doc/refman/8.0/en/innodb-transaction-isolation-levels.html#isolevel_repeatable-read). That means all queries within a transaction will use the same snapshot as the first database read.

In our code, immediately after opening the transaction we query the database via `processed_items = ProcessedItem.where(foreign_key: some_active_record_class.id)`. That means that all other queries afterwards will use the data from this point in time. Importantly, this means that `some_active_record_class.reload!` may not always contain the data updated in another process.

This mistake was easy to make because it's easy to assume that you'll always query against the latest version of the database but that's not true for transactions in MySQL (and maybe other databases).

To resolve this, you could set your the isolation level for your transaction to one that always reads to a fresh snapshot (like `READ COMMITTED`) or you could set the default for the whole database to a different isolation level. We wouldn't consider the second approach since it affected the whole application. We were also wary about using `READ COMMITTED` in general because we were unsure of the side effects of using `READ COMMITTED` in long running code with many database reads. It seems like `READ COMMITTED` is generally safe because it uses locks to ensure consistency but thought `REPEATABLE READ` was likely a sensible default that we should try to use if possible. Side note: we would definitely not use `READ UNCOMMITTED` because it could use an old version of a row for a read.

Our solution ended up changing the code to lock immediately after opening the transaction. This would ensure processes would only ever use the snapshot of the time of the lock and would prevent stale data from being read. In Rails, the update would look like:

```ruby
# ... beginning of method
ActiveRecord::Base.transaction do # Open a database transaction
  # Immediately lock the row with ID 123
  some_active_record_class.lock!
  # ... rest of method
```

Or in one line that opens a transaction and immediately locks:

```ruby
# ... beginning of method
some_active_record_class.with_lock do # Open a database transaction and lock the row
  # ... rest of method
```