#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use List::Util qw(sum);

my %square_root_of = map { $_ * $_ => $_ } 1 .. 1000;
my @squares = sort { $a <=> $b } keys %square_root_of;
my @triples;

foreach my $cc (@squares) {
    foreach my $aa (@squares) {
        my $bb = $cc - $aa;
        next if $bb < $aa;
        if ( exists $square_root_of{$bb} ) {
            push @triples, [ map { $square_root_of{$_} } ( $aa, $bb, $cc ) ];
        }
    }
}

my @perimeters = map { sum @$_ } @triples;

my $max = 0;
my $perimeter;

foreach my $p ( 3 .. 1000 ) {
    my $solutions = grep { $_ == $p } @perimeters;
    if ( $solutions > $max ) {
        $max       = $solutions;
        $perimeter = $p;
    }
}

say $perimeter;
