#!/usr/bin/perl -w

# this program count the different /24 prefixes in IP collection dataset

use strict;

my $current_pre;
my $cnt = 0;

# sub version
sub getpre{
  my (@inp) = @_;

  if ($inp[0] !~ m/^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/){
    print "getpre(): not an IP!\n";
    return 0;
  }else{
    my @strip = split(/\./, $inp[0]);
    my $pre = $strip[0] . "." .  $strip[1] . "." . $strip[2];
    return $pre;
  }
}

while(<>){
  my ($line) = $_;

  next if ($line =~ m/^#/);

  $line =~ s/\s//;

  my @strip = split(/\./, $line);
  my $pre = $strip[0] . "." .  $strip[1] . "." . $strip[2];

  print "$pre\n";

}


