#!/bin/bash

DATE1 = `date +%Y-%m-%d`  ### OR
# DATE1 = `date --date='next sun' +%Y-%m-%d`

WEEK_COUNT = 14

for i in ` seq 1 $WEEK_COUNT `
do
DATE2 =` date --date="$DATE1+7 days" +%Y-%m-%d `
DATE3 =` date --date="$DATE1+7 days" +%d%m%Y `
DATE1 = $DATE2
echo -ne "$DATE2 $DATE3\n"
done