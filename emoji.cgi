#!/usr/bin/perl -wT

use strict;
use warnings;
use diagnostics;
use utf8;
use CGI;
use Data::Dumper;

my $cgi = new CGI();
my $text = $cgi->param('text');

require "./listup.pl";

my $json = {
	input => "$text",
	result => &search($text)
};

$Data::Dumper::Indent = 0;
$Data::Dumper::Useqq = 1;
$Data::Dumper::Terse = 1;
$Data::Dumper::Pair = ":";

my $body = Dumper($json);

print("Content-Type: application/json; charset=UTF-8\r\n"); # Content-Typeヘッダを出力する
printf("Content-Length: %d\r\n", length($body));            # Content-Lengthヘッダを出力する
print("\r\n");                                              # ヘッダの終わりを示すCR+LFを出力する
print($body);                                               # ボディを出力する

exit(0);
