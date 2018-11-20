#!/usr/bin/bash

ip=$1
cerDir="$HOME/.ios-ota-server/"$ip"/"
# echo $ip
# echo $cerDir
mkdir -p "$cerDir"

# get rid of output
blackhole="/dev/null"

openssl genrsa -out "$cerDir"myCA.key 2048 2> $blackhole

openssl req -x509 -new -key "$cerDir"myCA.key -out "$cerDir"myCA.cer -days 730 -subj /CN="ios-ota-server"$ip" Custom CA" 2> $blackhole

openssl genrsa -out "$cerDir"mycert1.key 2048 2> $blackhole

openssl req -new -out "$cerDir"mycert1.req -key "$cerDir"mycert1.key -subj /CN=$ip 2> $blackhole

openssl x509 -req -in "$cerDir"mycert1.req -out "$cerDir"mycert1.cer -CAkey "$cerDir"myCA.key -CA "$cerDir"myCA.cer -days 365 -CAcreateserial -CAserial "$cerDir"serial 2> $blackhole

openssl pkcs12 -export -in mycert1.cer -inkey mycert1.key -out server.pkcs12

keytool -importkeystore -srckeystore server.pkcs12 -destkeystore server.jks -srcstoretype pkcs12
