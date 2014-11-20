Mid-Atlantic Wage Explorer
==========================

Welcome, this tool was built to simplify exploration of the mid-Atlantic wage data as found in the R data package ISLR. Data was manually assembled by Steve Miller, of Open BI (www.openbi.com), from the March 2011 Supplement to Current Population Survey data. (http://thedataweb.rm.census.gov/TheDataWeb)

In essence, this tool allows a user to investigate the influence of selected variables in the data set on wage as outcome. 

It allows to display graphs of wage data along selected a predictor variable, and coloring of data points according to a selected color variable, and allows to add locally weighted scatter-plot smoothing lines (LOESS).

The tools allows to create summary data by the x and color variables selected, including mean and standard deviation and the regular range summary information minimum, maximum, median and 25% and 75% quantiles.

The tools also allows to inspect number of observations by the x and color variables selected.


## Left Panel

The left panel contains the controls to select the variables for summarizing and graphing. 

Choose X Variable, selects the primary predictor variable that will be used to plot and tabulate wage data. 

Choose Color Variable, selects the secondary predictor variable that will be used to color individual data points in the plot, or have an extra dimension in the summary and frequency tables . X and Color variables can be the same of different.

The panel contains a dynamic portion:

- in case the Plot tab is active, the panel allows to add LOESS regression lines

- in case the Summary tab is active, the panel allows selection of what summary information is requested.

## Main Panel

The main panel consists of four tabs: “Plot”, "Summary", “Table” & “About”. Each tab explores the mid-Atlantic wage data along the dimensions chosen in the left panel, and displays data in in a different format.


### Plot Tab 

The plot tab shows a scatter plot as specified in the left panel. The Y axis is always the wage information and the x-axis is the variable chosen in the left panel. 

The plot caption summarized the variables being plotted.

Points in the scatter plot are colored according the the variable chosen in the left panel, a guide on the right of the plot shows the color variable and the values colors represent. A loess regression lines is added to the plot only when X variable is Age, one regression line for each value of the color value.

### Summary Tab 

Shows wage data summarized according to the chosen X and Color variable and summary function selection

### Table Tab 

Shows frequency information according to the chosen X and Color variable.

### About Tab

This page, general usage and notes

## Notes/Known Errors/Etc.

- issue: summary and table headers should be removed when x and color variables are the same 

- idea: might want to select other plots then scatter/jitter plots, boxplot, histogram, density etc

- idea: let user chose regression model (lm, loess, etc) and parameter

- idea:  should add a full data set visualization allowing to sort, search etc

- idea: add regression model summary info

Any feedback is welcome by submitting Issues/Pull Requests/etc on the Git repository https://github.com/guidogallopyn/DataProduct

## Thanks
Thanks to Jeff Leek, Roger Peng & Brian Caffo for putting together and running the Data Specialization on Coursera.

## Author
This tool was written by Guido Gallopyn for the Data Products course on Coursera
