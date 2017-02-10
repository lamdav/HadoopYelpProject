#!/usr/bin/env bash

mysql < create_db.sql
sqoop export --connect jdbc:mysql://$1/yelp --username $2 -m 4 --table Business --export-dir /tmp/pig/nonNullBusiness --input-fields-terminated-by '\t'
sqoop export --connect jdbc:mysql://$1/yelp --username $2 -m 4 --table Review --hcatalog-database yelp --hcatalog-table reviewClean
sqoop export --connect jdbc:mysql://$1/yelp --username $2 -m 4 --table ReviewSummary --hcatalog-database yelp --hcatalog-table reviewSummary