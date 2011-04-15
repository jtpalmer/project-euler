#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Math::Prime::XS qw(primes);
use List::MoreUtils qw(uniq);

sub generate_families {
    my ( $prime, $primes ) = @_;

    my @families;
    my @digits = uniq split //, $prime;

    foreach my $digit (@digits) {
        my @family;

        foreach my $n ( 0 .. 9 ) {
            ( my $x = $prime ) =~ s/$digit/$n/g;
            push @family, $x if $primes->{$x};
        }

        push @families, \@family if @family > 1;
    }

    return \@families;
}

my $length      = 3;
my $family_size = 8;

while (1) {
    my $min    = 10**$length;
    my $max    = ( 10**( $length + 1 ) ) - 1;
    my @primes = primes( $min, $max );
    my %primes = map { $_ => 1 } @primes;

    foreach my $prime (@primes) {
        my $families = generate_families( $prime, \%primes );

        foreach my $family (@$families) {
            if ( @$family == $family_size ) {
                say $prime;
                say join( ' ', @$family );
                exit;
            }
        }
    }

    $length++;
}
