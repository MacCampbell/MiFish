#!/usr/local/bin/perl 
use strict;
my $file = $ARGV[0];
my ($in, $out) = (0, 0);
 
open IN, "$file" or print "File not found. Usage: \$ perl Fastq_Nread_trim.pl <fastq>\n";

while(<IN>){
	my $id = $_;
	my $seq = <IN>;
	$in++;

	if ($seq =~ /N/){
		$_ = <IN>;
		$_ = <IN>;
	}
	else{
		$out++;
		print $id;
		print $seq;
		$_ = <IN>;
		print $_;
		$_ = <IN>;
		print $_;
	}
	
}

close IN;

my $percent = $out/$in*100;
print STDERR "$file\tinput\t$in\toutput\t$out\t$percent%\n";


