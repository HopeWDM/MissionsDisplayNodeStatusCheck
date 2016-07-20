#!/usr/bin/perl
use warnings;
use strict;

# make a subroutine
sub wgetRun {
	# backticks run external command/grep to return only matching part of string
	my $wgetOK = `wget -O /dev/null -o - http://10.40.97.46 | grep -o '200 OK\\|failed'`;

	# uncomment the following line if you're running scripts manually and trying to troubleshoot
	#print $wgetOK;

	# remove the newline output from grep
	chomp $wgetOK;
	if ($wgetOK eq '200 OK') {
		# if it's up, it's good
		return "good";
	}
	elsif ($wgetOK eq 'failed') {
		# if it's down, it's bad
		return "bad";
	}
	else {
		return "IDK";
	}
}

# simply "true" not allow with "use strict"
while (1==1) {
	# set vars
	#my $filename = '/tmp/status-dump.txt';
	my $fh;
	# make sure file exists
	system('/usr/bin/touch /tmp/status-dump.txt');
	# open file read/write, without clobbering
	open ($fh, ">>", '/tmp/status-dump.txt');
	# sets status to good or bad
	my $status = wgetRun;
	wgetRun;
	# print crap
	print $fh $status;
	close $fh;
	# wait a few seconds
	sleep 4;
}
