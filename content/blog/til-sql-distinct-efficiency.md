---
title: "TIL: SQL DISTINCT Efficiency"
date: 2023-11-07T16:35:46-07:00
draft: false
tags:
- til
---

Today I learned that `DISTINCT` statements can cause efficiency problems.

I was looking at some code that made a few joins across tables and used distinct for the column names. The query was causing high CPU load and it wasn't immediately obvious from first glance why that was happening. You could imagine the query looked like this (with a few more joins and selects):

```sql
SELECT DISTINCT transactions.date, transactions.total_amount, transaction_items.amount, transaction_items.name
FROM transactions
INNER JOIN transaction_items ON transaction_items.transaction_id = transactions.id
WHERE transactions.date BETWEEN '2023-01-01' AND '2023-12-31';
```

From a high level, in order to execute this statement the database will filter for the rows that we need, grab the data we need from those rows, and return the unique ones. That seems simple enough for a database as long as the `date` column is indexed. However, the important part to consider is what the database needs to do to ensure all the data returned is unique. The database would need to keep all that data in memory someplace and use CPU time to sort these columns then remove the duplicates. Without the inclusion of a unique index, the sort will take time because there's no guarantee that each column is unique.

At first glance, the SQL statement seems harmless because everything looks like it will be obviously unique at baseline - we're joining against IDs so it must all be unique. However, the database likely won't figure that out and will fall back to doing the more computationally intensive thing of sorting and removing duplicates.

The better thing for this particular query is to remove the `DISTINCT` altogether. This code may be buggy to begin with because there could be transactions on the same date with the same total amount, etc. Besides the bug, the `DISTINCT` is unnecessary because the results should be unique because we're joining on unique IDs.

If the `DISTINCT` had to stay, it may be better to also select primary IDs so that the database could ensure that certain fields are guaranteed to be unique - that way it doesn't have to spend time sorting the results.
