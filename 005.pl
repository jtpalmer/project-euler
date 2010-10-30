#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Math::Big::Factors 'factors_wheel';
use List::Util 'max';

my $n = 20;
my %factors;
foreach my $m ( 2 .. 20 ) {
    my @factors = factors_wheel($m);
    foreach my $f (@factors) {
        $factors{$f}
            = max( $factors{$f} // 0, scalar grep { $_ == $f } @factors );
    }
}

my $x = 1;
while ( my ( $f, $n ) = each(%factors) ) {
    $x *= $f**$n;
}

say $x;
