### STRATA Infrastructure ###

### AWS Account Configuration ###

Set up three instances under the solutions engineering "environment"
* EC2: Runs RSP, data transfers, and psql admin
* S3: Holds the csv flight data
* Redshift: Stores the flight database

Solutions engineering "environment"
* acct: 2632-4590-8434
* vpc: 26812543
* subnet: 99942afc
* keypar: solutions-eng
* security group: rsp cluster

Estimated AWS total cost per hour
* Redshift
* EC2
* EBS
* S3
* I/O

### Create RSP Instance (Ubuntu) ###

Choose Ubuntu LTS 14.04 Trusty 
vpc: 26812543
subnet: 99942afc
Security Groups: rsp cluster strata 2015
  SSH My IP
  Custom TCP 8787 Anywhere
  HTTP 22 Anywhere 
Keypair: solutions-eng
EBS vol 1028
Instance: Ubuntu 14.04
Size: r3 - memory optimized

### Create S3 bucket ###

bucket: solutions-eng-data
folder: flights
aws_access_key_id=XXXXXXXXXXXXXXXXXXXX
aws_secret_access_key=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

### Create Redshift Instance ###

cluster identifier: strata1
database name: mydb
security group: default
  rsp cluster
  myip
port: 5439
master username: nathan
password: XXXXXXXX
host: strata1.cjku7otn8uia.us-west-2.redshift.amazonaws.com
