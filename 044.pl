#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;

sub pentagonal {
    my ($n) = @_;
    return $n * ( 3 * $n - 1 ) / 2;
}

my @pentagonal = map { pentagonal($_) } 1 .. 5_000;
my %pentagonal = map { $_ => 1 } @pentagonal;

my $x = 0;
while ( $x < @pentagonal ) {
    foreach my $y ( 0 .. $x ) {
        my ( $p, $q ) = @pentagonal[ $y, $x - $y ];
        if (   defined $pentagonal{ $p + $q }
            && defined $pentagonal{ $p - $q } )
        {
            say $p - $q;
            exit;
        }
    }
    $x++;
}
