---
title: "AR Resource Finder"
date: 2017-03-02T14:04:10-07:00
draft: true
---

This application was created for the 2017 General Motors (GM) Arizona Hackathon. It integrated with existing GM services to locate resources (people, rooms, printers, bathrooms) in an augmented reality (AR) Android application.

The application utilizes a custom AR framework to display the resources on the screen. The application utilized multiple Android services like the location, compass, gyroscope, accelerometer & camera to position AR objects on the screen. A resource's location was determined by comparing the user's current location, height & compass position and the target resource's location & height; the framework also weighted AR object size by distance from the user. On the backend, the application connected to a Node.js server to get general resource data like its positioning, availability, and status. Additionally, we developed a custom sensor with an Arduino to sense the availability of a bathroom stall and communicate the availability back to the server.

For this application, I developed a majority of the Android mobile application code. I completed the following tasks:

* Activities to manage the Android layout.
* Autocomplete functionality for the search which queried a local database to populate results.
* A caching service to store server data in a local database for quicker, cached results.
* The lower layer for the AR display which consisted of a real time camera view.
* The upper layer for the AR display which calculated an object's position and size on the screen.
* The upper layer for the AR display also used a Canvas object from Android Graphics to draw custom graphics objects on the screen. The custom objects were simple geometric objects with resource photos (e.g. profile pictures) and text of resource statistics (distance, availability).
* An async task to listen to user movement events including gyroscope and accelerometer events. Upon receiving update events, the async task triggered the upper layer for the AR display to redraw.

---
## Screenshots

### AR Resource Finder App Main Page

![AR Resource Finder App Main Page](/static/img/ar-resource-finder/ar-finder-base-screenshot.jpg)

### AR Person Finder

![AR Person Finder](/static/img/ar-resource-finder/ar-finder-people-screenshot.jpg)

### AR Printer Finder

![AR Printer Finder](/static/img/ar-resource-finder/ar-finder-printer-screenshot.jpg)

### AR Bathroom Finder

![AR Bathroom Finder](/static/img/ar-resource-finder/ar-finder-bathroom-screenshot.jpg)
