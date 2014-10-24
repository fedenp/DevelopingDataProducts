Time Series Forecasting: Top 100 US Markets
========================================================

Federico Navarro

Fri Oct 24 08:39:28 2014


Revenue Management in the Airline Industry
========================================================

The Airline Industry is a volatile industry with dynamic changes every year. Every airline struggles yearly to overcome the very high fixed costs. For that, the airlines have implemented Revenue Management Theories. 

The main idea of Revenue Management is well explained by Robert Crandall, CEO of American Airlines in the 1980s:

"Sell the right seats to the right customer at the right price at the right time"



Forecasting in the Airline Industry
========================================================

One of the most important tasks in Revenue Management is forecasting. Increasing forecast accuracy allows Revenue Managers to maximize revenues. 

This shiny apps is an interactive web tool that uses Exponential Smoothing and ARIMA Models to forecast passenger demand by month for the top 100 Round Trip in the US Domestic Markets. 
The data can be downloaded for free from the Deparment of Transportation in the following URL: 

"http://www.transtats.bts.gov/DL_SelectFields.asp?Table_ID=259&DB_Short_Name=Air Carriers"


App Widgets 
========================================================

In the UI, the first thing Users need to do is to determine three things: 

- Market to forecast
- Method to use: Exponential Smoothing or Arima
- How many periods to forecast: from 1 to 12

The App has 4 tabs: 

- The Historical Series
- The Seasonal Plot
- Forecasting Results
- Used Data


The Main App 
========================================================

![plot of chunk unnamed-chunk-1](Presentation-figure/unnamed-chunk-1.png) 
