---
title: "Setting Up PPPoE at Home for Asus RT-AX88U"
date: 2022-12-31T07:42:51-07:00
draft: false
---

Earlier this year, I got a new Asus RT-AX88U router for my home.
We were having issues with the router randomly dropping internet connection and restarting itself.
The range was also bad for our home.

We had some issues setting up PPPoE on the new router because it wasn't obvious where to input the [VLAN ID that we used for our old Netgear AC1750 router.](../setting-up-pppoe-at-home)

Luckily, I found this [blog post about configuring an ASUS RT-N66U](https://dougrathbone.com/blog/2018/03/31/configuring-a-thirdparty-asus-rtac3200-router-to-directly-connect-to-a-centurylink-gigabit-gpon-service) that worked well for our RT-AX88U.

The correct spot to input the VLAN ID was in the IPTV tab of the LAN settings.
The table on that screen has an Internet row where you can input the VID, which I assume is an abbreviation for VLAN ID.
I also selected the Manual Setting for ISP profile.

![VLAN ID configuration screenshot](/static/img/setting-up-pppoe-at-home-for-asus-ac3200/vlan.jpg)

Setting the PPPoE credentials was pretty straightforward.
I inputted this information in the WAN settings under the Internet Connection tab.
The WAN connection type was PPPoE and I inputted the username and password further down the page.
