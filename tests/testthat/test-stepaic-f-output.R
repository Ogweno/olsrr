context("stepAIC forward regression output")

model <- lm(y ~ ., data = surgical)

test_that("output from stepAIC forward regression is as expected", {
  x <- cat("--------------------------------------------------------------------------
Variable         AIC        Sum Sq           RSS        R-Sq     Adj. R-Sq
--------------------------------------------------------------------------
liver_test     771.875    3804272.477    4565248.060    0.455        0.444
alc_heavy      761.439    4743349.776    3626170.761    0.567        0.550
enzyme_test    750.509    5515514.136    2854006.401    0.659        0.639
pindex         735.715    6278360.060    2091160.477    0.750        0.730
bcs            730.620    6535804.090    1833716.447    0.781        0.758
--------------------------------------------------------------------------")

  expect_output(print(ols_step_forward_aic(model)), x)
})


test_that("output from stepAIC forward regression is as expected when details == TRUE", {
  x <- cat(" Step 0: AIC = 802.606
 y ~ 1

--------------------------------------------------------------------------------
Variable       DF      AIC        Sum Sq           RSS        R-Sq     Adj. R-Sq
--------------------------------------------------------------------------------
liver_test      1    771.875    3804272.477    4565248.060    0.455        0.444
enzyme_test     1    782.629    2798309.881    5571210.656    0.334        0.322
pindex          1    794.100    1479766.754    6889753.784    0.177        0.161
alc_heavy       1    794.301    1454057.255    6915463.282    0.174        0.158
bcs             1    797.697    1005151.658    7364368.879    0.120        0.103
alc_mod         1    802.828     271062.330    8098458.207    0.032        0.014
gender          1    802.956     251808.570    8117711.967    0.030        0.011
age             1    803.834     118862.559    8250657.978    0.014       -0.005
--------------------------------------------------------------------------------


 Step 1 : AIC = 771.8753
 y ~ liver_test

-------------------------------------------------------------------------------
Variable       DF      AIC        Sum Sq          RSS        R-Sq     Adj. R-Sq
-------------------------------------------------------------------------------
alc_heavy       1    761.439    939077.300    3626170.761    0.567        0.550
enzyme_test     1    762.077    896004.331    3669243.729    0.562        0.544
pindex          1    770.387    285591.786    4279656.274    0.489        0.469
alc_mod         1    771.141    225396.238    4339851.822    0.481        0.461
gender          1    773.802      6162.222    4559085.838    0.455        0.434
age             1    773.831      3726.297    4561521.763    0.455        0.434
bcs             1    773.867       685.256    4564562.805    0.455        0.433
-------------------------------------------------------------------------------


 Step 2 : AIC = 761.4394
 y ~ liver_test + alc_heavy

-------------------------------------------------------------------------------
Variable       DF      AIC        Sum Sq          RSS        R-Sq     Adj. R-Sq
-------------------------------------------------------------------------------
enzyme_test     1    750.509    772164.360    2854006.401    0.659        0.639
pindex          1    756.125    459358.635    3166812.126    0.622        0.599
bcs             1    763.063     25195.587    3600975.173    0.570        0.544
age             1    763.110     22048.109    3604122.652    0.569        0.544
alc_mod         1    763.428       784.551    3625386.210    0.567        0.541
gender          1    763.433       443.343    3625727.417    0.567        0.541
-------------------------------------------------------------------------------


 Step 3 : AIC = 750.5089
 y ~ liver_test + alc_heavy + enzyme_test

-----------------------------------------------------------------------------
Variable     DF      AIC        Sum Sq          RSS        R-Sq     Adj. R-Sq
-----------------------------------------------------------------------------
pindex        1    735.715    762845.924    2091160.477    0.750        0.730
bcs           1    750.782     89836.308    2764170.093    0.670        0.643
alc_mod       1    752.403      5607.570    2848398.831    0.660        0.632
age           1    752.416      4896.081    2849110.320    0.660        0.632
gender        1    752.509         5.958    2854000.443    0.659        0.631
-----------------------------------------------------------------------------


 Step 4 : AIC = 735.7146
 y ~ liver_test + alc_heavy + enzyme_test + pindex

-----------------------------------------------------------------------------
Variable     DF      AIC        Sum Sq          RSS        R-Sq     Adj. R-Sq
-----------------------------------------------------------------------------
bcs           1    730.620    257444.030    1833716.447    0.781        0.758
age           1    737.680      1325.880    2089834.596    0.750        0.724
gender        1    737.712        90.186    2091070.290    0.750        0.724
alc_mod       1    737.713        60.620    2091099.857    0.750        0.724
-----------------------------------------------------------------------------


 Step 5 : AIC = 730.6204
 y ~ liver_test + alc_heavy + enzyme_test + pindex + bcs

---------------------------------------------------------------------------
Variable     DF      AIC       Sum Sq         RSS        R-Sq     Adj. R-Sq
---------------------------------------------------------------------------
age           1    732.494    4280.830    1829435.617    0.781        0.754
gender        1    732.551    2360.288    1831356.159    0.781        0.753
alc_mod       1    732.614     216.992    1833499.455    0.781        0.753
---------------------------------------------------------------------------
No more variables to be added.


                          Model Summary
-----------------------------------------------------------------
R                       0.884       RMSE                 195.454
R-Squared               0.781       Coef. Var             27.839
Adj. R-Squared          0.758       MSE                38202.426
Pred R-Squared          0.700       MAE                  137.656
-----------------------------------------------------------------
 RMSE: Root Mean Square Error
 MSE: Mean Square Error
 MAE: Mean Absolute Error

                                 ANOVA
-----------------------------------------------------------------------
                   Sum of
                  Squares        DF    Mean Square      F         Sig.
-----------------------------------------------------------------------
Regression    6535804.090         5    1307160.818    34.217    0.0000
Residual      1833716.447        48      38202.426
Total         8369520.537        53
-----------------------------------------------------------------------

                                      Parameter Estimates
------------------------------------------------------------------------------------------------
      model         Beta    Std. Error    Std. Beta      t        Sig         lower       upper
------------------------------------------------------------------------------------------------
(Intercept)    -1178.330       208.682                 -5.647    0.000    -1597.914    -758.746
 liver_test       58.064        40.144        0.156     1.446    0.155      -22.652     138.779
  alc_heavy      317.848        71.634        0.314     4.437    0.000      173.818     461.878
enzyme_test        9.748         1.656        0.521     5.887    0.000        6.419      13.077
     pindex        8.924         1.808        0.380     4.935    0.000        5.288      12.559
        bcs       59.864        23.060        0.241     2.596    0.012       13.498     106.230
------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------
Variable         AIC        Sum Sq           RSS        R-Sq     Adj. R-Sq
--------------------------------------------------------------------------
liver_test     771.875    3804272.477    4565248.060    0.455        0.444
alc_heavy      761.439    4743349.776    3626170.761    0.567        0.550
enzyme_test    750.509    5515514.136    2854006.401    0.659        0.639
pindex         735.715    6278360.060    2091160.477    0.750        0.730
bcs            730.620    6535804.090    1833716.447    0.781        0.758
--------------------------------------------------------------------------")

  expect_output(print(ols_step_forward_aic(model, details = TRUE)), x)
})
