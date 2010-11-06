#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use List::Util qw(sum);
use Math::Prime::XS qw(is_prime sieve_primes);

my %prime     = map { $_ => 1 } sieve_primes(999_999);
my %not_prime = map { $_ => 1 } 0 .. 999_999;
delete $not_prime{$_} foreach keys %prime;

sub _is_prime {
    my ($p) = @_;

    return 1 if exists $prime{$p};
    return 0 if exists $not_prime{$p};

    if ( is_prime($p) ) {
        $prime{$p} = 1;
        return 1;
    }
    else {
        $not_prime{$p} = 1;
        return 0;
    }
}

sub left_truncatable {
    my ($p) = @_;

    foreach my $l ( 2 .. length($p) - 1 ) {
        return 0 unless _is_prime( substr( $p, -$l, $l ) );
    }

    return 1;
}

sub right_truncatable {
    my ($p) = @_;

    foreach my $l ( 2 .. length($p) - 1 ) {
        return 0 unless _is_prime( substr( $p, 0, $l ) );
    }

    return 1;
}

my @digits = sieve_primes(9);

my @truncatable;
my $middle_size = 0;
while ( @truncatable < 11 ) {
    foreach my $first (@digits) {
        foreach my $last (@digits) {
            if ( $middle_size > 0 ) {
                foreach my $middle ( 0 .. 10**$middle_size - 1 ) {
                    my $n = sprintf( "%d%0${middle_size}d%d",
                        $first, $middle, $last );
                    if (   _is_prime($n)
                        && left_truncatable($n)
                        && right_truncatable($n) )
                    {
                        push @truncatable, $n;
                    }
                }
            }
            else {
                my $n = $first . $last;
                if ( _is_prime($n) ) {
                    push @truncatable, $n;
                }
            }
        }
    }
    $middle_size++;
}

say sum @truncatable;
