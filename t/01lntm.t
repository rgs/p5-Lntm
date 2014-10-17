#!perl

use strict;
use warnings;
use Test::More tests => 7;

BEGIN { use_ok 'Lntm' }

is(linetime('no entry'), 0, 'no date');
is(linetime('[ WARN | 2014-01-01 01:02:03 ] Log Entry'), 1388534523);
is(linetime("2014-2014/01/01\t01:02:04:03 2014-03-21 12:02:31"), 1388534524);
is(linetime, 0, 'no $_');
$_ = "\n2014/01/01  01:02:05\n";
is(linetime, 1388534525, 'defaults to $_');
is(linetime, 1388534526, 'defaults to $_ in for ') for '2014-01-01 01:02:06';
