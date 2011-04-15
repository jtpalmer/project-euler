#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use List::Util qw(sum);
use Text::CSV;

sub alpha_value {
    my ($letter) = @_;
    return ord($letter) - 64;
}

sub score {
    my ( $position, $name ) = @_;
    return $position * sum map { alpha_value($_) } split( //, $name );
}

my $csv = Text::CSV->new();
open my $fh, '<', 'names.txt' or die $!;
my @names = @{ $csv->getline($fh) };

@names = sort @names;

say sum map { score( $_ + 1, $names[$_] ) } 0 .. $#names;
