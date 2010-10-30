#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Lingua::EN::Numbers qw(num2en);

my $letters;

foreach my $n ( 1 .. 1000 ) {
    my $number = num2en($n);
    my @matches = ( $number =~ /[a-z]/g );
    $letters += @matches;
}

say $letters;
