#!/bin/bash

if [ -z "$1" ]; then
	out_dir="jpeg"
else
	out_dir="$1/$(basename $PWD)"
	out_dir="$(echo $out_dir | sed 's/ / /g')"
fi

mkdir -p "${out_dir}"

for i in *.CR2; do
	sips -s format jpeg $i --out "${out_dir}/${i%.*}.jpg"
done
