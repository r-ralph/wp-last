#!/usr/bin/perl -wT

use strict;
use warnings;
use diagnostics;
use utf8;

sub search {
    my $keyword = $_[0];
    my @EMOJIS = (
      ['smile', '1F604', 'smiling face with open mouth and smiling eyes'],
      ['simple_smile', '1F603', 'smiling face with open mouth']
    );

    my @result = ();
    foreach my $emoji(@EMOJIS){
      if (@$emoji[0] =~ /$keyword/) {
        my $emoji_h = {
          name => @$emoji[0],
          hex => @$emoji[1],
          description => @$emoji[2]
        };
        push(@result, $emoji_h);
      }
    }
    return \@result;
}

1;
