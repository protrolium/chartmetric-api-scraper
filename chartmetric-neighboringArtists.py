#!/usr/local/bin/python3

import os
import re
import csv
import sys
import json

#run ./chartmetric.py file_to_parse.json out_putdir

# for batch
# $ find ./ -maxdepth 1 -type f -name "*.json" -exec ./chartmetric-neighboringArtists.py "{}" ../../temp \;

# merge CSV of type
# $ awk 'FNR == 1 && NR!=1{next;}{print}' *_metric.csv > merged.csv

# alternate method
# $ find ./ -name *the_metrics.csv -exec sh -c "cat {} | tail -n +2 >> /tmp/big_metric.csv"\;

if len(sys.argv) < 3:
    sys.exit("chartmetric.py artist_name out_dir")

cm_json_file = sys.argv[1]
out_dir = sys.argv[2]


if not os.path.exists(cm_json_file):
    sys.exit(f"Can't find {cm_json_file}?")

print(cm_json_file)
if not os.path.exists(out_dir):
    sys.exit(f"Can't find {out_dir}")
    #or add code to mkdir

#Remove the path and extension from the file
#https://stackoverflow.com/questions/3548673/how-to-replace-or-strip-an-extension-from-a-filename-in-python
artist = os.path.basename(cm_json_file).rsplit( ".", 1 )[0]

#I'm going to use the artist name in the file, so if there are chars that the filesystem can't deal with, we need to deal with them
#think of the artist formerly known as prince, and how would you write that to a file.  I'm just going to remove non-alpha numerics..


# read file to json
with open(cm_json_file, 'r') as cm_json:
    data = cm_json.read()

cm_obj = json.loads(data)

#itterate over everything in "obj" keys
for metric_type in cm_obj['obj'][0].keys():


    #first we make the file name for the csv it is a combination of artist_metric name
    #we need to make sure the artist name is going to work with the files system.  I'm going to remove non-alpha numeric, a little overkill but good enough
    #think of trying to do this for the artist formerly known as prince.  you couldn't
    safe_artist  = re.sub("[^0-9a-zA-ZÀ-ž'$¿?.]+", '', artist)
    out_file_name = f"{safe_artist}_{metric_type.replace(' ','_')}.csv"
    #now we add on the out_dir for the absolute locaiton of the csv we're going to write
    abs_file_out  = os.path.join(out_dir,out_file_name)


    #open the csv file(abs_file_out) for the current metric (metric_type)
    with open(abs_file_out, 'w', newline='') as csvfile:
        #make the csv_writer check the doc for all the options
        #https://docs.python.org/3/library/csv.html
        csv_writer = csv.writer(csvfile,delimiter=',',quotechar='"',quoting=csv.QUOTE_NONNUMERIC)


        #https://bytes.com/topic/python/answers/474711-how-determine-object-scriptable
        if isinstance(cm_obj['obj'][0][metric_type], (list)):
            #handle if the record type is a list
            #get the header from the keys of the 'metric_type' and write it as the first row
            header_list = list(cm_obj['obj'][0].keys())
            #add 'artist' to the begining of the header
            header_list.insert(0,'artist')
            csv_writer.writerow(header_list)
            for metric_rec in cm_obj['obj'][0][metric_type]:
                #add artist name to the metric values and dump it out to the csv
                values = list(metric_rec.values())
                values.insert(0,artist)
                csv_writer.writerow(values)
        else:
            #it's one of those non array types so we just make arrays and dump em
            header_list = ['artist',metric_type]
            csv_writer.writerow(header_list)
            row = [artist,cm_obj['obj'][0][metric_type]]
            csv_writer.writerow(row)

print(cm_json_file)
