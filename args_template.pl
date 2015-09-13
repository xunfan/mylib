#!/usr/bin/perl -w

use strict;

# set required number of args here
my $req_num_args = 1;

sub prt_usage{
	print "arguments wrong!\nusage: $0 xxx\n";
	exit(1);
}

if (($#ARGV+1) < $req_num_args){
	prt_usage();
}

# get arguments
my $arg1 = $ARGV[0];


# handle directory path arguments
#=pod
my $arg_path = $ARGV[0];
my $path;
if ($arg_path =~ m/^\//){
        # absolute path in linux
        $path = $arg_path;
}else{
        $path = "\./" . $arg_path;
}

if ($path !~ m/\/$/){
        $path = $path . "\/";
}

### list dir 
opendir DIR, $path or die "Can not open \"$path\"/n";
my @dirlist = readdir DIR;

foreach my $x (@dirlist){
	next if ($x =~ m/^\.$/ || $x =~ m/^\.\.$/);
#	print "$x \n";
}

#=cut

### rest of the program

