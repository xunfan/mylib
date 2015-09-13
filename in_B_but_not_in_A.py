#!/usr/bin/python

import sys
import re

if __name__ == '__main__':
  b_fn = sys.argv[2]
  a_fn = sys.argv[1]

  a_fh = open(a_fn, "r")
  b_fh = open(b_fn, "r")

  a_dict = {}
  for line in a_fh:

    # get rid of empty line and comment line
    if (re.compile('^$').match(line)):
      continue 
    if (re.compile('^#').match(line)):
      continue
    
    linesp = line.strip()
    if linesp not in a_dict:
      a_dict[linesp] = 1

  out_arr = []
  for line in b_fh:
    if (re.compile('^$').match(line)):
      continue 
    if (re.compile('^#').match(line)):
      continue

    lsp = line.strip()
    
    if lsp not in a_dict:
      out_arr.append(lsp)


  for x in sorted(set(out_arr)):
    print x
