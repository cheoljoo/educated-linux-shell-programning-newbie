#!/bin/bash
read line

echo "dir=${line%\/*} file=${line##*\/}"
