#!/usr/bin/perl -wT

use strict;
use warnings;
use diagnostics;
use utf8;

sub search {
    my $keyword = $_[0];
    $keyword =~ s/://mg;
    my @EMOJIS = (
      ['smile',         '1F604', 'smiling face with open mouth and smiling eyes'],
      ['simple_smile',  '1F642', 'smiling face with closed mouth'],
      ['laughing',      '1F606', 'smiling face with open mouth and tightly-closed eyes'],
      ['blush',         '1F60A', 'smiling face with smiling eyes'],
      ['smiley',        '1F603', 'smiling face with open mouth'],
      ['smirk',         '1F60F', 'smirking face'],
      ['heart_eyes',    '1F60D', 'smiling face with heart-shaped eyes'],
      ['kissing_heart', '1F618', 'face throwing a kiss'],
      ['kissing_closed_eyes',
                        '1F61A', 'kissing face with closed eyes'],
      ['flushed',       '1F633', 'flushed face'],
      ['relieved',      '1F60C', 'relieved face'],
      ['satisfied',     '1F606', 'smiling face with open mouth and tightly-closed eyes'],
      ['grin',          '1F601', 'grinning face with smiling eyes'],
      ['wink',          '1F609', 'winking face'],
      ['stuck_out_tongue_winking_eye',
                        '1F61C', 'face with stuck-out tongue and winking eye'],
      ['stuck_out_tongue_closed_eyes',
                        '1F61D', 'face with stuck-out tongue and tightly-closed eyes'],
      ['grinning',      '1F603', 'smiling face with open mouth'],
      ['kissing',       '1F617', 'kissing face'],
      ['kissing_smiling_eyes',
                        '1F619', 'kissing face with smiling eyes'],
      ['stuck_out_tongue',
                        '1F61B', 'face with stuck-out tongue'],
      ['sleeping',      '1F634', 'sleeping face'],
      ['worried',       '1F61F', 'worried face'],
      ['frowning',      '1F626', 'frowning face with open mouth'],
      ['anguished',     '1F627', 'anguished face'],
      ['open_mouth',    '1F62E', 'face with open mouth'],
      ['grimacing',     '1F62C', 'grimacing face'],
      ['confused',      '1F615', 'confused face'],
      ['hushed',        '1F62F', 'hushed face'],
      ['expressionless',
                        '1F611', 'expressionless face'],
      ['unamused',      '1F612', 'unamused face'],
      ['sweat_smile',   '1F605', 'smiling face with open mouth and cold sweat'],
      ['sweat',         '1F613', 'face with cold sweat'],
      ['disappointed_relieved',
                        '1F622', 'crying face'],
      ['weary',         '1F629', 'weary face'],
      ['pensive',       '1F614', 'pensive face'],
      ['disappointed',  '1F61E', 'disappointed face'],
      ['confounded',    '1F616', 'confounded face'],
      ['fearful',       '1F628', 'fearful face'],
      ['cold_sweat',    '1F630', 'face with open mouth and cold sweat'],
      ['persevere',     '1F623', 'persevering face'],
      ['cry',           '1F625', 'disappointed but relieved face'],
      ['sob',           '1F62D', 'loudly crying face'],
      ['joy',           '1F602', 'face with tears of joy'],
      ['astonished',    '1F635', 'dizzy face'],
      ['scream',        '1F631', 'face screaming in fear'],
      ['tired_face',    '1F62B', 'tired face'],
      ['angry',         '1F620', 'angry face'],
      ['rage',          '1F621', 'pouting face'],
      ['triumph',       '1F624', 'face with look of triumph'],
      ['sleepy',        '1F62A', 'sleepy face'],
      ['yum',           '1F60B', 'face savouring delicious food'],
      ['mask',          '1F637', 'face with medical mask'],
      ['sunglasses',    '1F60E', 'smiling face with sunglasses'],
      ['dizzy_face',    '1F635', 'dizzy face'],
      ['imp',           '1F47F', 'imp'],
      ['smiling_imp',   '1F608', 'smiling face with horns'],
      ['neutral_face',  '1F610', 'neutral face'],
      ['no_mouth',      '1F636', 'face without mouth'],
      ['innocent',      '1F607', 'smiling face with halo']
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
