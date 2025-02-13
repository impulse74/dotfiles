#!/bin/sh

while true; do
	datetime=$(date +"%d. %m. %Y %H:%M:%S")

	xsetroot -name "$datetime"

	sleep 1
done
