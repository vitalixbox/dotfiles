#!/bin/bash

echo $1

grip -b ${1:-README.md} localhost:8888
