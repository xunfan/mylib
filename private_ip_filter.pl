#!/usr/bin/perl -w

use strict;

while(<>){
	my ($ipstr, $ns) = split;
  next  if ($ipstr =~ m/^0\./ || $ipstr =~ m/^10\./ || $ipstr =~ m/^127\./ || $ipstr =~ m/^169\.254\./ || $ipstr =~ m/^172\.16\./ || $ipstr =~ m/^192\.168\./); 
  print "$ipstr\n";
}
