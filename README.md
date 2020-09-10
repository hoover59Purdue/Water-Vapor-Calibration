# Water-Vapor-Calibration
OliviaCalFitFn.R code reads in Olivia's finaldata_enriched...txt file to create the calibration fit function (OliviaFitFn.Rdata) 
The OliviaCalFitFn.R code can be adjusted to create a better fitting, fit function in the higher [H2O] (adjusting bandwidth)
You will load in the fit function you decide to use (either your own creation or OliviaFitFn.Rdata) to apply to your Acre data using ApplyCalToAcre.R code. 
Calibration is applied to dD and dO18 data from ACRE at Purdue University for 5 events

The five events are:
5/26/2019,
5/30/2019,
6/9/2019,
7/16/2019,
8/20/2019

Only have calibration data for:
May 30 (Event 2) and 
August 20 (Event 5)

Regarding bandwidths,
a kernal density smoothing (a type of probability density estimate), you're replacing each point in that calibration data collection with a gaussian curve that is centered on that point's value. 
When the gaussian curves are all added up, that total distribution affects how the line is influenced while being fit through the calibration points. 
The bandwidth is the amount of uncertainty/ how wide that gaussian curve is. 
In this case, it's the [H2O] values. So in this case, a larger value will make the gaussian curves wider, and the best fit line is less influenced by any single point. 
You will notice that at smaller bandwidths, the curve is more jumpy especially at the higher [H2O] where there's less points, and smoother when you increase the bandwidth.

Helpful resource on Kernel Desity Smoothing
  http://wiki.analytica.com/Kernel_Density_Smoothing
This is also helpful to visualize the difference in bandwidth values, about 3/4th down the page 
  https://towardsdatascience.com/kernel-regression-made-easy-to-understand-86caf2d2b844
