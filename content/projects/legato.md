---
title: "Legato - Autonomous Vehicle Manager"
date: 2016-11-25T13:18:54-07:00
draft: false
summary: "An overview of the autonomous vehicle manager Android app that allowed autonomous car owners to track their car movements and schedule car activities in real time. Developed for the 2016 General Motors National Hackathon Championships."
---

This application was created for the 2016 General Motors National Hackathon Championships. It integrates the user's life with autonomous vehicle services.

The application utilizes calendars provided by the user to schedule events for your autonomous car to use. The application can automatically suggest events by querying the OnStar API for things like oil levels. Calendar events and destinations display on the Android app so the user is aware of their car's location. In addition, the application supports notifications for car pickup/dropoff events and Lyft money earning events. The backend is a Node.js server and the front end is an Android application.

For this application, I developed most of the mobile application. I completed the following tasks:

* Activities to manage each Android layout.
* Classes to query the server and parse JSON results for output to the user.
* Classes to post to the server for adding events.
* Services to connect and listen to socket on the Node.js server and display car location and notifications to the user based on output from the socket.
* Display for the car location data returned from the server on the Google Map component.
* Display for the event data returned from the server on the Android Week View calendar component and map markers for event locations.
* GUI creation utilizing built-in Android UI components, Google Material Design fundamentals & icons, Google Maps, and external UI libraries.
* Integration of the [Android Week View Library](https://github.com/alamkanak/Android-Week-View) and the [Navigation Tab Bar Library](https://github.com/Devlight/NavigationTabBar) for UI design.

---
## Screenshots

### Legato App Main Page

![Legato App Main Page](/static/img/legato/legato-base-screenshot.png)

### Legato Oil Change Notification

![Legato Oil Change Notification](/static/img/legato/legato-oil-change-notification-screenshot.jpg)

### Legato Oil Change Suggested Event

![Legato Oil Change Suggested Event](/static/img/legato/legato-suggested-event-screenshot.jpg)

### Legato Car Unlock Notifications

![Legato Car Unlock Notifications](/static/img/legato/legato-car-unlock-notification-screenshot.jpg)

### Legato Car Unlock Popup

![Legato Car Unlock Popup](/static/img/legato/legato-car-unlock-popup-screenshot.jpg)

### Legato Settings

![Legato Settings](/static/img/legato/legato-settings-screenshot.jpg)
