#!/usr/bin/perl -w

use strict;

my $current;
my $count = 0;


while(<>){
	my ($line) = split;

	if (!defined($current)){
		$current = $line;
		$count++;
	}else{
		if($current ne $line){
			print "$current\t$count\n";
			$current = $line;
			$count = 1;
		}else{
			$count++;
		}
		
	}

}

print "$current\t$count\n";
