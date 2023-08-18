#!/bin/sh
#chmod +x 
# TCCharley2004TCCharley2004 timeperiod Aug 09#for day in {14..29}
# Livneh needs to be adjusted to a day lag i.e. whatever preciitation accumulate dfor Aug 13 is actually being noted on Aug 14.
# since few stations have recording of morning 5 am/3 am /8 am or sometimes 2pm.
# So I am adjusting the daily data - noted Aug 14 belongs to Aug 13.
#for day in {14..29}
#do
#cdo seldate,200808${day} livneh_unsplit*.nc livneh_200808${day}.nc;
# create a cumulative nc file of total accumulation from Aug 13 to Aug 28, 2008
cdo enssum dailydata_Aug_9_14/livneh_2004*.nc Livneh_charley_total.nc;
#done

 
