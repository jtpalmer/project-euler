#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use List::MoreUtils qw(uniq);

sub is_pandigital {
    my ($n) = @_;

    foreach my $d ( 0 .. 9 ) {
        return 0 unless $n =~ /$d/;
    }

    return 1;
}

sub has_unique_digits {
    my ($n) = @_;

    my @d = split( //, $n );

    return scalar @d == scalar uniq @d;
}

sub chains {
    my ( $n, @chunks ) = @_;

    return ($n) unless @chunks;

    my $head = substr( $n, 0, 2 );
    my $end = pop @chunks;
    my @chains;
    foreach my $e (@$end) {
        if ( $head eq substr( $e, 1, 2 ) ) {
            push @chains, chains( substr( $e, 0, 1 ) . $n, @chunks );
        }
    }
    return @chains;
}

my @divisors = qw(2 3 5 7 11 13 17);
my @chunks;
foreach my $d (@divisors) {
    my @c;
    my $n = 0;
    while ( ( my $c = sprintf( '%03d', $d * $n ) ) < 1000 ) {
        if ( has_unique_digits($c) ) {
            push @c, $c;
        }
        $n++;
    }
    push @chunks, \@c;
}

my $sum;
my $end = pop @chunks;
foreach my $x (@$end) {
    foreach my $n ( chains( $x, @chunks ) ) {
        foreach my $a ( 1 .. 9 ) {
            my $b = $a . $n;
            if ( is_pandigital($b) ) {
                $sum += $b;
            }
        }
    }
}
say $sum;
