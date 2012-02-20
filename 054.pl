#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use List::Util qw(max);
use Data::Compare;

my @card_values = ( 2 .. 9, 'T', 'J', 'Q', 'K', 'A' );
my %card_ranks = map { $card_values[$_] => $_ } 0 .. $#card_values;

sub hand_rank {
    my ($cards) = @_;

    my @cards = map { [ split //, $_ ] } @$cards;

    foreach my $checker (@hand_checkers) {
        if (my $data = $checker[1]->(@cards)) {
            return [ $hand_rank[$checker[0]], @$data ];
        }
    }
}

my @hand_checkers = (
    [   high_card => sub {
            my @cards = @_;
            return [ max map { $card_ranks{$_->[0]} } @cards ];
        },
    ],
    [   one_pair => sub {
            my @cards = @_;
        },
    ],
    [   two_pairs => sub {
            my @cards = @_;
        },
    ],
    [   three_of_a_kind => sub {
            my @cards = @_;
        },
    ],
    [   straight => sub {
            my @cards = @_;
        },
    ],
    [   flush => sub {
            my @cards = @_;
        },
    ],
    [   full_house => sub {
            my @cards = @_;
        },
    ],
    [   four_of_a_kind => sub {
            my @cards = @_;
        },
    ],
    [   straight_flush => sub {
            my @cards = @_;
        },
    ],
    [   royal_flush => sub {
            my @cards = @_;
        },
    ],
);

my %hand_ranks = map { $hand_checkers[$_][0] => $_ } 0 .. $#hand_checkers;

open my $fh, '<', 'poker.txt' or die $!;

my $wins = 0;

while (<$fh>) {
    chomp;
    my @cards = split / /, $_;
    my @hands = ( [ @cards[ 0 .. 4 ] ], [ @cards[ 5 .. 9 ] ] );
    my @ranks = map { hand_rank($_) } @hands;
    $wins++ if $ranks[0][0] > $ranks[1][0];

    if ($ranks[0][0] == $ranks[1][0]) {
        say 'Tie';
        say 'Player 1: ', join( ' ', @{ $hands[0] } );
        say 'Player 2: ', join( ' ', @{ $hands[1] } );
    }
}

say $wins;
