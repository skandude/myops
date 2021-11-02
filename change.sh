#!/bin/bash
sed  "s/imgtag/$1/" pod.yaml > newpod.yaml
