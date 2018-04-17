---
title: "Surname Search - Surname Population Density & Income Distribution"
date: 2014-04-18T13:47:54-07:00
draft: false
---

This application was developed for my undergraduate honors thesis and was accepted and published at EuroVA 2014. The work was supported partially from an award from U.S. Department of Homeland Security’s VACCINE Center and a grant from the Engineering and Physical Sciences Research Council UK EPSRC. It received surname input from the user and output a population density map and income distribution for that surname.

The application combined Java web services and MySQL on the backend and HTML, Javascript, [d3.js](https://d3js.org), [jQuery](http://jquery.com), and the [Google Maps API](https://developers.google.com/maps/web/) on the frontend. The application also utilized Java to precompute surname population densities and income distribution. The precomputation for the surname data utilized a phonebook database to link surnames to latitudes and longitudes. Each surname within the database estimated the density utilizing a [kernel density estimation](https://en.wikipedia.org/wiki/Kernel_density_estimation) function. With the surnames precomputed, when a user entered a surname, the web service simply looked up the precomputed data and returned it to the frontend. The frontend displayed the population density heatmap on top of a Google map of the United States and utilized [D3.js](https://d3js.org) to display the income distribution and a similar names word cloud.

I extended previous work that computed a population density heatmap based on a surname. My contributions and results from the project include:

* Rewrote the population density heatmap calculation to compute the kernel density estimation for a surname based on a regular distribution (plain distribution with no restrictions) and probabilistic distribution (lowering the probability based on the total population density of that area).
* Added calculations for income distribution based on the given surname utilizing [United States Census data](https://www.census.gov/data/data-tools.html). Later added additional options for the income distribution to utilize the [Zillow API](https://www.zillow.com/howto/api/APIOverview.htm).
* Converted from on demand surname calculations to precomputed population densities and income distributions.
* Expanded the application to find similar surnames based on the given surname's distribution heatmap and income distribution.
* Integration with the [Google Maps API](https://developers.google.com/maps/web/) to compute the population distribution heatmap overlay image and to display this image on top of a Google Map on the frontend.
* [D3.js](https://d3js.org) integration to graph the income distribution in predefined bins.
* [D3-Cloud](https://github.com/jasondavies/d3-cloud) (a D3.js extension) integration to display the most similar surnames for a given surname.
* Integrated with the [Twitter API](https://developer.twitter.com) to allow users to tweet about using the application.
* Presented the application at the Spring 2014 Barrett Honors Symposium.
* Successfully defended the research for my undergraduate honors thesis in Spring 2014.
* Published at [EuroVA 2014](http://www.eurova.org). You can [read the paper here](https://doi.org/10.2312/eurova.20141143).

## Screenshots

### Ibarra Surname Density - Regular Search

![Ibarra Surname Density - Regular Search](/static/img/surname-density/surname-density-base-screenshot.png)

### Ibarra Surname Density - Probabilistic Search

![Ibarra Surname Density - Probabilistic Search](/static/img/surname-density/ibarra-probabilistic-screenshot.jpg)

### Kimes Surname Density - Regular Search

![Kimes Surname Density - Regular Search](/static/img/surname-density/kimes-regular-screenshot.jpg)

## External Resources

* [Paper (Published at EUROGRPAHICS 2014)](https://doi.org/10.2312/eurova.20141143)
* [Demo](https://vader.dtn.asu.edu:8443/NameAnalysis/html/index.html)
* [Video](https://www.youtube.com/watch?v=pANl4YJ1C5I&feature=youtu.be)
* [Github](https://github.com/jibarra/Geo-Genealogy-Research)
* [Bitbucket](https://bitbucket.org/jibarra/geo-genealogy-research)
