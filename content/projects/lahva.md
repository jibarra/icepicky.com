---
title: "Linked Animal-Human Health Visual Analytics (LAHVA) Expansion"
date: 2013-04-26T13:48:06-07:00
draft: false
pageSummary: "An overview of the LAHVA research project that expanded the existing visual analytics tool that enabled users to investigate health incidents and correlate them to weather conditions."
---

This application was developed for the Spring 2013 [Fulton Undergraduate Research Initiative (FURI)](https://furi.engineering.asu.edu). The application allowed users to load a health and weather data set to display graphically on a map. The map displayed the counties for a country and changed the color of a county based on the number of health incidents. The user could change the the health condition (such as gastrointestinal problems) or the weather condition (such as temperature). Once the data fields were selected, the data was displayed on the map and the user could hover over a county to display a graph correlating the selected health condition to the selected weather condition.

I extended previous work that developed the base structure of the application and computed the weather and health correlations. My contributions and results from the project include:

* Modify the graph display to display the actual weather values or the change in weather values.
* Plot weather station locations on the map.
* Enabling the user to change the date range to recalculate the weather and health correlations.
* Graphing healthy symptoms over a time period (default: 7 days).
* Modify the weather/health correlation calculations to be multi-threaded. Increased calculation times by ~33%.
* Calculate Pearson's coefficient to provide a mathematical correlation for the weather/health correlation graph.
* Presented research at the [Spring 2013 FURI Symposium](https://furi.engineering.asu.edu/wp-content/uploads/2013/04/FURI_abstract-spring13.pdf).

---
## Screenshots

### LAHVA Application Screenshot

![LAHVA Application Screenshot](/static/img/lahva/lahva-base-screenshot.png)

### LAHVA Change Over Week

![LAHVA Change Over Week](/static/img/lahva/lahva-week-change-screenshot.jpg)
