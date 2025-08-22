---
title: "A Metaphor for Refactors"
date: 2025-08-21T18:14:55-06:00
draft: false
---

I wrote this piece as a part of a weekly project update email at Bonusly. I wanted to give non-technical folks an understanding of why changes can take a long time to implement and why we sometimes need to do refactors. I iterated on it a bit to come to the correct metaphor, starting at the metaphor that our system is a "tangled mess of spaghetti" and ending at this version.

For context, group giving was the feature we were adding at the time and it was difficult because of how we represented giving reasons in the codebase. The general plan laid out here is actually what we followed and led to a successful launch that allowed users to easily give recognition to groups.

I thought it'd be useful to share publicly to help other folks explain refactors. I've edited it from the original message to make it more understandable to folks outside Bonusly.

---

Why do seemingly easy changes take so long for us to implement?

One reason is we work with the cruft of a codebase that's been built up over time. Adding more features to Bonusly eventually makes it harder to add something substantially different. Here’s an example of that in the real world:

Let’s say you start an Italian restaurant. You don’t know how to cook so you hire a chef to start the restaurant off with a simple menu: spaghetti and meatballs. The restaurant takes off so you hire four chefs and add four more menu items: penne and meatballs, lasagna, and spaghetti bolognese. You want to start adding menu items with alfredo sauce but your chefs say it’s too hard.

You go to the kitchen and see that the chefs have split up and built their own stations for the meals they specialize in. One chef works on spaghetti and meatballs, another on penne and meatballs, etc. A few chefs make their own sauce while others borrow from those chefs - this is similar for the other common ingredients like meatballs. Adding alfredo sauce will be hard because there’s a lot of complexity in how your chefs make a dish.

![An unoptimized kitchen with many chefs building their own stations and lots of crossed paths of dependencies in the kitchen](/static/img/a-metaphor-for-refactors/unoptimized-chef-kitchen.png)

So you implement a few changes: instead of creating the same common ingredients separately, you make one common ingredient for use in every dish. So one chef exclusively works on the sauce, another on the meatballs, etc. And for individual menu items, you can make the tweaks you need for it (like using different noodles). Now if the sauce quality starts to degrade, you just need to fix it at the one sauce station and it will fix it for all the menu items. And now that the common ingredients are consolidated, you can easily add alfredo sauce to the mix and then add new menu items.

![An unoptimized kitchen with many chefs that collaborate better and improve efficiency](/static/img/a-metaphor-for-refactors/optimized-chef-kitchen.png)

Bonusly has added more and more features (menu items) over time. Now adding group giving (alfredo sauce) is hard. We have recognition (spaghetti and meatballs) which has the reason text (the sauce basic ingredient). Lots of places in our codebase have been grabbing a recognition reason and pulling out what that area of the code needs, like recipients or hashtags. All the places that are doing this for recipients assume that the recipient is always a username. However, now we need to handle something like `@scott.walkers.team` which will represent a group instead of usernames.

One option to solve this is to just update all those areas directly. Another option is to follow the restaurant example: make it easier to handle groups everywhere. This adheres to a principle I like to follow: [when you’re implementing a new feature, make the change easy then make the easy change.](https://x.com/KentBeck/status/250733358307500032) So going back to our restaurant example: instead of continuing to add to the mess of the kitchen, we should consolidate how we make common ingredients, start making the alfredo sauce, then add the new alfredo sauce dish dish. And in our case: instead of adding to the mess of our code, we’re going to consolidate the code that parses the recipients from the reason and then we’ll add the concept of groups and finally we’ll add group giving.

Parsing a reason to get the recipients should always be the same so we should group all that logic together. And now when something changes about how we parse a recognition reason (like adding groups), our entire codebase will reflect that. Much like if we change the recipe for our sauce, all the menu items will have their sauce taste the same.
