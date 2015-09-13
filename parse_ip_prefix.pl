#!/usr/bin/perl -w
#

use strict;

my @blacklist = ( 
	"169.254.0.0|16" ,
	"172.16.0.0|12" ,
	"192.0.2.0|24" ,
	"192.88.99.0|24" ,
	"192.168.0.0|16" ,
	"192.0.0.0|24" ,
	"198.18.0.0|15" ,
	"198.51.100.0|24" ,
	"203.0.113.0|24" 
);

my @BLprefix = ();
my @BLlength = ();
my $BLelementscnt = 0;

sub BlacklistInit{
	my $i = 0;
	my $hexpre;
	my $hexlen;
	my ($pre, $len);
	foreach(@blacklist){
		($pre, $len) = split(/\|/, $_);
		my ($a, $b, $c, $d) = split(/\./, $pre);
		$hexpre = $a * (2**24) + $b * (2**16) + $c * (2**8) + $d;
		push(@BLprefix, $hexpre);
		$hexlen = ~(2**$len -1);
		push(@BLlength, $hexlen);
		$i++;
	}
	$BLelementscnt = @BLprefix;
#	print "size: $i\n";
}

sub checkevil{
	my ($addr) = @_;
	my $i = 0;
	for ($i = 0; $i < $BLelementscnt; $i++)
	{
		if(($addr & $BLlength[$i]) == $BLprefix[$i]){
			return 1;
		}
	}
	return 0;
}

BlacklistInit();

my $test1 = 192 *(2**24) + 168*(2**16) + 1*(2**8) + 1;
my $test2 = 192 *(2**24) + 1*(2**16) + 1*(2**8) + 1;

my $res = checkevil($test1);
print "$res\n";
$res = checkevil($test2);
print "$res\n";

my $testlen = ~(2**16 - 1);
my $out = $testlen & $test1;
print "$test1\t$out\n";
