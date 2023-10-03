



# Processing Steps:
- [x] 1. Use the download and rename the imerg files - 0.1 deg
- [ ] 2. Use the code to regrid and mask
- [ ] 3. cretae cumulative data
- [ ] 4. Create data for VIC ascii file


Download the IMERG data from Earthdata

download txt file through openDAP option https://disc.gsfc.nasa.gov/datasets/GPM_3IMERGDF_06/summary (instructions)[https://purdue0-my.sharepoint.com/personal/tiwari13_purdue_edu/_layouts/15/doc.aspx?sourcedoc={3fe1709e-1128-454b-8055-dca445ca5647}&action=edit] 
  - download using wget - rename the files - daily nc4 data created(use download_imerg.sh)
This script will dowload and rename the data downlaoded for the region

#!/bin/sh
#Michael - 20181014 to oct 14 2018

#------- Download IMERG using links in the txt file -------
wget -P ./openDAP --load-cookies ~/.urs_cookies --save-cookies ~/.urs_cookies --auth-no-challenge=on --keep-session-cookies -i TCM*.txt

#------- rename the files for ease -------
for date in {20181004..20181014}
do
mv openDAP/3B-DAY.MS.MRG.3IMERG.${date}*nc4* renamed/imerg_${date}.nc4;

done
