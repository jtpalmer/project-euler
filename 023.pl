#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Math::Factor::XS qw(factors);
use List::Util qw(sum);
use Memoize;

memoize('d');

sub d {
    my ($n) = @_;
    my @factors = factors($n);
    unshift @factors, 1;
    return sum @factors;
}

my %abundant = map { $_ => 1 } grep { d($_) > $_ } 2 .. 28123;
my @abundant = sort keys %abundant;

my @numbers;
N: foreach my $n ( 1 .. 28123 ) {
    foreach my $a ( grep { $_ < $n } @abundant ) {
        if ( defined $abundant{ $n - $a } ) {
            next N;
        }
    }
    push @numbers, $n;
}
say sum @numbers;
