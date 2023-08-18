#!/bin/sh
#chmod +x 
# HurricaneCharley stormperiod is Aug 09 to Aug 15 2004.
# G-COOP needs to be adjusted to a day lag i.e. 
#whatever precipitation accumulated for Aug 09 is actually being noted on Aug 10.
# since few stations have recording of morning 5 am/3 am /8 am or sometimes 2pm.
# So I am adjusting the daily data - noted Aug 10 belongs to Aug 09.

#module load cdo

for day in {9..15}
do
cdo seldate,200408${day} livneh_unsplit*.nc livneh_200408$((day-1)).nc;
#cdo seldate,200408${day} ~/scratch/home/phig/TCFay2008/Livneh/livneh_unsplit*.nc livneh_200408$((day-1)).nc;

# create a cumulative nc file of total accumulation from Aug 09 to Aug 15, 2004
#cdo enssum livneh_2008*.nc Livneh_fay_total.nc;
#cdo enssum livneh_2008*.nc G-COOP_charley_total.nc;
done

 