#!/usr/bin/perl -w

use strict;

while(<>){
  next if ($_ =~ m/^#/);
  print $_;
}
