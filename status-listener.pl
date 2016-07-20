#!/usr/bin/perl
use warnings;
use strict;

my $filename = '/tmp/status-dump.txt';
my $fh;
my $i;

while (1==1) {
	for ($i = 0; $i < 100; $i++) {
		open ($fh, "<", $filename);
		while (my $x = <$fh>) {
			# # cut off the trailing newline
			# chomp $x;
			if ($x =~ m/badbadbadbad/g) {
				system('/sbin/reboot');
			}
		}
		close $fh;
		if ($i == 99) {
			system('rm /tmp/status-dump.txt');
		}
		sleep 3;
	}
}
