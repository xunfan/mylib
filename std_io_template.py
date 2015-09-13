#!/usr/bin/python

import sys
import re

if __name__ == '__main__':
  #if len(sys.argv) < 2:
  #  print "Usage:", sys.argv[0], "aaa"
  #  exit(0)
  for line in sys.stdin:

    # get rid of empty line and comment line
    if (re.compile('^$').match(line)):
      continue 
    if (re.compile('^#').match(line)):
      continue
    
    linesp = line.split()
