---
title: "Travalet - OnStar Integrated Car Scheduler"
date: 2016-09-13T13:47:38-07:00
draft: false
summary: "An overview of the OnStar integrated car scheduling Android app that enabled users to schedule car functions with their Gmail and Google Calendar events. Developed for the 2016 General Motors Arizona Hackathon."
---

This application was created for the 2016 General Motors Arizona Hackathon. It integrates the user's email events with existing OnStar services.

The applciation utilizes Google's Gmail API to find events in the future and automatically schedule oil changes, tire pressure stops and gas station stops. The application utilized different stop and end times for events, such as waking up the user, starting the car and the car leaving for the final destination. The application also automatically sends mapping data to the car before events and sets alarms to wake up the user. The backend is a Java server and the front end is an Android application.

For this application I completed most of the backend Java code. I completed the following tasks:

* Google API connection classes which integrated with the Gmail API endpoints. These classes enabled the reading of threads within a user's mailbox and connection to Google credentials.
* OnStar API connection classes which connected public OnStar endpoints including: Vehicle Diagnostics, Vehicle Location, Mapping Services.
* Classes to predict the user's need for fuel, tire pressure or oil changes before a trip.
* Classes to give the client side the user's events and the server predictions for start/end times for each part of an event.
* Service token management for OnStar and Gmail APIs.
* Basic static website to control the server, enabling the control of certain demonstration situations like low oil.

---
## Screenshots

### Travalet App Main Page

![Travalet App Main Page](/static/img/travalet/travalet-main-page-screenshot.png)

### Travalet App Add Event Page

![Travalet App Add Event Page](/static/img/travalet/travalet-base-screenshot.png)

### Travalet Server Web

![Travalet Server Web](/static/img/travalet/travalet-server-web-screenshot.jpg)
