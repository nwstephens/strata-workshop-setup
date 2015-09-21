### STRATA Infrastructure ###

### Upload Data to Redshift ###

SET autocommit ON

drop table if exists flights;

CREATE TABLE flights(
year integer   encode lzo,
month integer   encode lzo,
dayofmonth integer   encode delta DISTKEY,
dayofweek integer   encode delta,
deptime integer   encode delta32k,
crsdeptime integer   encode lzo,
arrtime integer   encode delta32k, 
crsarrtime integer   encode lzo,
uniquecarrier varchar(10)   encode lzo,
flightnum integer   encode lzo,
tailnum varchar(10)   encode lzo, 
actualelapsedtime integer   encode bytedict,
crselapsedtime integer   encode bytedict,
airtime varchar(5)   encode bytedict,
arrdelay integer   encode bytedict,
depdelay integer   encode bytedict, 
origin varchar(5)   encode RAW,
dest varchar(5)   encode lzo,
distance integer   encode lzo,
taxiin varchar(5)   encode bytedict,
taxiout varchar(5)   encode bytedict,
cancelled integer   encode lzo,
cancellationcode varchar(5)   encode lzo,
diverted integer   encode lzo,
carrierdelay varchar(5)   encode lzo,
weatherdelay varchar(5)   encode lzo,
nasdelay varchar(5)   encode lzo,
securitydelay varchar(5)   encode lzo,
lateaircraftdelay varchar(5)   encode lzo 
)
SORTKEY(origin,uniquecarrier);

COPY flights 
FROM 's3://solutions-eng-data/flights/'
credentials 'aws_access_key_id=XXXXXXX;aws_secret_access_key=XXXXXXXXX' 
CSV DELIMITER ','
NULL 'NA'
ACCEPTINVCHARS
IGNOREHEADER 1;

SELECT count(*) FROM flights; /* 123,534,969 */


