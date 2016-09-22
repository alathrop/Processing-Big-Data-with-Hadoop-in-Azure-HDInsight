#!/usr/bin/env python

import sys
import string

while True:
  line = sys.stdin.readline()
  if not line:
    break

  row = string.strip(line, "\n")
  year, miles, vans, trucks = string.split(row, "\t")
  total_freight = float(vans) + float(trucks)
  print "\t".join([year, miles, str(total_freight)])

