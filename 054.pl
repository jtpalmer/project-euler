#!/usr/bin/env perl
use strict;
use warnings;
use 5.010;
use Games::Cards::Poker;

open my $fh, '<', 'poker.txt' or die $!;

my $wins = 0;

while (<$fh>) {
    chomp;
    my @cards = split / /, $_;
    my @hands = ( [ @cards[ 0 .. 4 ] ], [ @cards[ 5 .. 9 ] ] );
    my @ranks = map { ScoreHand(@$_) } @hands;
    $wins++ if $ranks[0] < $ranks[1];

    say join( ' ', @{ $hands[0] } );
    say join( ' ', @{ $hands[1] } );
    say 'Player 1 Wins' if $ranks[0] < $ranks[1];
    say 'Player 2 Wins' if $ranks[0] > $ranks[1];
    say 'Tie'           if $ranks[0] == $ranks[1];
    say '';

}

say $wins;

