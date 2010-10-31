#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Date::Manip::Date;

my $days = 0;
foreach my $year ( 1901 .. 2000 ) {
    foreach my $month ( 1 .. 12 ) {
        my $date = new Date::Manip::Date;
        $date->parse_date( sprintf( "%d-%02d-01", $year, $month ) );
        $days++ if $date->printf('%w') eq '7';
    }
}
say $days;
