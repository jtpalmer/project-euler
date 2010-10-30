#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use List::Util qw(sum reduce);

my %squares = map { $_ * $_ => $_ } 1 .. 1000;

foreach my $cc ( keys %squares ) {
    foreach my $aa ( keys %squares ) {
        my $bb = $cc - $aa;
        if ( exists $squares{$bb} ) {
            my $sum = sum @squares{ $aa, $bb, $cc };
            if ( $sum == 1000 ) {
                say reduce { $a * $b } @squares{ $aa, $bb, $cc };
                exit;
            }
        }
    }
}
