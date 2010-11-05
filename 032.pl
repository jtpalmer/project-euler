#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use List::Util qw(sum);
use Algorithm::Permute;

my %products;

my $p = Algorithm::Permute->new([1 .. 9]);

while (my @r = $p->next()) {
    foreach my $a ( 0 .. 6 ) {
        my $x = join('', @r[0 .. $a]);
        foreach my $b ( $a + 1 .. 7 ) {
            my $y = join('', @r[$a + 1 .. $b]);
            my $z = join('', @r[$b + 1 .. 8]);
            $products{$z} = 1 if $z == $x * $y;
        }
    }
}

say sum keys %products;
