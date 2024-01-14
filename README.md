# ThirdPaper
multistorm analysis
Created: Aug17,2023


Research Steps:
- [x] 1. Finding the storms to consider 
- [ ] 2. assimilating the rainfall dataset
- [ ] 3. hydrology


Storms considering - [OneDrive Slide](https://purdue0-my.sharepoint.com/personal/tiwari13_purdue_edu/_layouts/15/doc.aspx?sourcedoc={fe2b7e77-47ea-449f-a6a5-8470732622f8}&action=edit)

 - [pdf report for all storms NHC](https://www.nhc.noaa.gov/data/tcr/index.php?season=2012&basin=atl)

A. 2004 : [Hurricane Charley](https://www.nhc.noaa.gov/data/tcr/AL032004_Charley.pdf) (Aug 12 - 15, 2004)\
B. 2004 : [Hurricane Frances](https://www.nhc.noaa.gov/data/tcr/AL062004_Frances.pdf) (Sep 3 - 11, 2004)\
C. 2004 : [Hurricane Jeanne](https://www.nhc.noaa.gov/data/tcr/AL112004_Jeanne.pdf) (Sep 25 - 30, 2004)\
D. 2008 : [Tropical Storm Fay](https://www.nhc.noaa.gov/data/tcr/AL062008_Fay.pdf) (Aug 17 - 29, 2008)\
E. 2012 : [Tropical Storm Beryl](https://www.nhc.noaa.gov/data/tcr/AL022012_Beryl.pdf) (May 26 - 30, 2012)\
F. 2012 : [Tropical Storm Debby](https://ialert.com/docs/AL042012_Debby.pdf) (June 23 - 27, 2012)\
F. 2017 : [Hurricane Irma](https://www.nhc.noaa.gov/data/tcr/AL112017_Irma.pdf) (Sep 8 - 14, 2017)\
G. 2018 : [Hurricane Michael](https://www.nhc.noaa.gov/data/tcr/AL142018_Michael.pdf) (Oct 6 - 12, 2018)

Rainfalls Observed during these Storms: https://www.wpc.ncep.noaa.gov/#page=ovw
https://www.wpc.ncep.noaa.gov/tropical/rain/2011.html (Available with year and nae wise)
| Name  | Rain Max (in) |
| ------------- | ------------- |
| Charley 2004  | 9.88  |
| Frances 2004  | 23.57  |
| Jeanne 2004  | 11.97  |
| Fay 2008  | 27.65  |
| Beryl 2012  | 15  |
| Debby 2012 | 28.78 |
| Irma 2017  | 21.66  |
| Michael 2018  | 13.01  |

## DECISION ON STORM PERIOD:
1. Charley - 9-14 august



## DATA ASSIMILATION
- a. G-COOP
  - a zipped file for "nc" files from 1915 to 2018 is available
  - unzip for the year needed
  - create daily data "nc" file for storm period
  - create cummulative "nc" file
 
  - unzip -j "livneh1915-2018.zip" "livneh...2012(yeardesired).nc" "/RawData(desired directory)"
  - GCOOP.sh - to extract exact dates for dailydata - G-COOP/Data/dailydata
  - GCOOP_total.sh - to create cumulative for the storm period - G-COOP/Data
  - 
- b. IMERG
  - download txt file through openDAP option https://disc.gsfc.nasa.gov/datasets/GPM_3IMERGDF_06/summary (instructions)[https://purdue0-my.sharepoint.com/personal/tiwari13_purdue_edu/_layouts/15/doc.aspx?sourcedoc={3fe1709e-1128-454b-8055-dca445ca5647}&action=edit] 
  - download using wget - rename the files - daily nc4 data created(use download_imerg.sh)
  - masking and projection
 
  - DOWNLOAD: download the txt link
  - download_imerg.sh - IMERG/RawData/openDAP 0.1x0.1 deg
  - rename.sh -   IMERG/RawData/renamedP 0.1x0.1 deg
  - PROCESSING_MASKING:
  - Process_IMERG_GCOOP_Daily.ipynb (need xesmf environment) - IMERG/Data/dailydata 0.0625 x 0.0625 deg
  - imrtg_total.sh - to create cumulative for the storm period - IMERG/Data 0.0625 x 0.0625 deg
  - 
- c. StageIV
  - submit order to download Stage IV data from EOL NCAR uCAR website https://data.eol.ucar.edu/cgi-bin/codiac/fgr_form/id=21.093
  - Recieve email download data using the links sent
  - sort the 06h - 6 hourly data ina folder: we wil luse 6 hr data to create 24 hr data
  - sort by storm dates - use copy_stiv.sh to only move data relate dto all eight storms
  - the folder stiv06h has grib files
  - convert to netcdf and convert the polar to cartesian
