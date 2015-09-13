#!/usr/bin/python

import sys
import re

if __name__ == '__main__':
  if len(sys.argv) < 3:
    print len(sys.argv), "Usage: " + sys.argv[0] + \
          " <targets file> <pool file>";
    exit(1)

  unique_flag = 1
  target_idx = 0
  pool_idx = 0
  target_fh = open(sys.argv[1], "r")
  pool_fh = open(sys.argv[2], "r")

  target_dict = {}
  for line in target_fh:

    # get rid of empty line and comment line
    if (re.compile('^$').match(line)):
      continue 
    if (re.compile('^#').match(line)):
      continue
    
    lsp_list = line.split()

    if lsp_list[target_idx] not in target_dict:
      target_dict[lsp_list[target_idx]] = 1
  target_fh.close()

  unique_dict = {}
  for line in pool_fh:
    # get rid of empty line and comment line
    if (re.compile('^$').match(line)):
      continue 
    if (re.compile('^#').match(line)):
      continue
    
    lsp_list = line.split()

    cur_rec = lsp_list[pool_idx]
    if cur_rec in target_dict:
      if unique_flag == 1:
        if cur_rec not in unique_dict:
          for x in range(len(lsp_list)-1):
            print lsp_list[x],
          print lsp_list[-1]
          
          unique_dict[cur_rec] = 1
      else:
        for x in range(len(lsp_list)-1):
          print lsp_list[x],
        print lsp_list[-1]
  pool_fh.close()
