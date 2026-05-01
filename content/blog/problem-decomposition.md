---
title: "Problem Decomposition"
date: 2026-05-01T05:12:38-06:00
draft: false
---

Problem decomposition has always been a key skill for software engineers. Even with LLMs, it continues to be important to be successful. LLMs don't have infinite context and even with lots of context, they struggle to produce accurate outputs when the context is too large. So breaking down problems helps LLMs be a useful tool and also helps you think through problems.

I'm going to talk about how it's useful and then discuss how to build the skill. But the most important thing to remember is that breaking down problems is a skill learned through practice so try to practice it as much as you can.

# Execution
Execution is where most engineers demonstrate problem decomposition. When you've picked up a ticket, you're likely figuring out the parts to resolve it: what needs to be done, what needs to change, and how you'll land it. You could be considering if you want it to be separate pull requests too.

This skill can be applied at a larger scale. For projects, you can break it down into individual pieces. This helps to isolate the pieces of a project into component parts and allows you to build it into a cohesive solution. When separated in smaller pieces, you can think through the order of release and think through any safety or launch concerns. You can choose good stopping points too: you could split up a project in two and release the first part to learn in preparation for the second release.

Splitting it up can help you and others understand your approach. The separation allows you to describe the issue and solution at different granularity levels. You can describe it at a high level so that you can explain the approach to people not familiar with the specifics. Others can glance at a high level explanation and understand how the problem would be solved. And for people more familiar, they can dive into the details to get a clear understanding of the specifics. This way, you and others can critically analyze an approach from the general steps (e.g. "yes, generally this would solve our issue") and also at a detailed level to resolve edge cases (e.g. "this will work for our large customers too").

Dividing up the execution of tasks, big or small, enables you to think through the best way to solve your problems. The more you do it, the better your execution will become.

# Expanded to other areas
Breaking down problems can be applied to other areas beyond execution, too.

You can use the skill when you want to make broad org changes. If you have a problem you want to solve for the org, break it down into small parts and apply those parts to see if it'll work. In smaller pieces, you can introduce change to a small group of people, learn from it, and iterate on it as you expand it to other areas of the org. It also makes it easier to roll out more broadly because it helps build momentum.

Breaking down a problem helps understand a new codebase or domain, too. You don't need to understand everything to be productive in a domain. If you're comfortable breaking it down into pieces, you can slowly learn and understand what you need as you go. It helps you be effective without being a complete expert.

The skill helps when investigating bugs too. Breaking down the problem solving helps a lot here: reproducing the bug, identifying problem areas, proving the cause, and resolving it are all separate steps. Approaching it in smaller pieces means you don't have to solve it all at once.

Problem decomposition works well in your personal life too. It helps with chores: it's a lot easier to finish a big chore in smaller steps. It helps with teaching someone something new: you can break the learning down into pieces and slowly teach each piece.

# Practice
The key to improving your skill of breaking down problems is to practice it. When you're working on a ticket, break it up into small PRs or commits that make sense in isolation. When working on a small project, break it out into implementable tickets. When working on a large project, break it out into small projects that can be delivered separately.

Don't forget that this is a learning experience: don't be afraid to write out your thought process and reevaluate your approach if it doesn't make sense on review.

Keep practicing and the skill will become second nature.
