#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Math::Prime::XS qw(primes);

sub are_permutations {
    my ( $x, $y ) = @_;

    foreach my $n ( split( //, $x ) ) {
        return 0 unless $y =~ /$n/;
    }

    foreach my $n ( split( //, $y ) ) {
        return 0 unless $x =~ /$n/;
    }

    return 1;
}

my @primes = primes( 1000, 9999 );
my %primes = map { $_ => 1 } @primes;

my @sequences;

foreach my $a ( 0 .. $#primes ) {
    foreach my $b ( $a + 1 .. $#primes ) {
        my ( $p, $q ) = ( $primes[$a], $primes[$b] );
        my @sequence = ( $p, $q );
        my $step     = $q - $p;
        my $n        = $q + $step;
        while ( $primes{$n} ) {
            push @sequence, $n;
            $n += $step;
        }
        if ( @sequence > 2 ) {
            push @sequences, \@sequence;
        }
    }
}

foreach my $seq (@sequences) {
    foreach my $start ( 0 .. $#$seq - 2 ) {
        my @sub = @$seq[ $start .. $start + 2 ];
        if (   are_permutations( $sub[0], $sub[1] )
            && are_permutations( $sub[0], $sub[2] ) )
        {
            say @sub;
        }
    }
}
