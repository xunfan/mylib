#!/usr/bin/perl -w

use strict;

my @buf;
my @cnt;
my $t_cnt = 0;

while(<>){
  next if ($_ =~ m/^#/);
	my ($in, $c) = split;

  push(@buf, $in);
  push(@cnt, $c);

  $t_cnt = $t_cnt + $c;
}


my $num = $#buf + 1;

my $cur_c = 0;
for (my $i=0; $i<$num; $i++){
  $cur_c = $cur_c + $cnt[$i];
  my $cdf = $cur_c / $t_cnt;

  print "$buf[$i]\t$cdf\n";
}
