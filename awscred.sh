#!/bin/bash

/usr/local/bin/aws configure << EOF
$1
$2
us-east-1
json
EOF
