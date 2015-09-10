package Lntm;
use 5.14.2;
no warnings 'uninitialized';
use Date::Parse;

sub import {
    no strict;
    *{caller.'::linetime'} = \&linetime;
}

sub linetime (_) {
    my ($line) = @_;
    $line =~ m!\b(20[0-9][0-9][-/][01][0-9][-/][0123][0-9]\s+[012][0-9]:[0-5][0-9]:[0-5][0-9])!
        and return str2time($1);
    $line =~ m!\b(20[0-9][0-9][-/][01][0-9][-/][0123][0-9])!
        and return str2time("$1 00:00:00");
    return 0;
}

1;

=head1 NAME

Lntm - Helps getting timestamps from files in 1-liners

=head1 SYNOPSIS

    perl -MLntm -nE 'say linetime' /var/log/cronjob/mylogfile.log

=head1 DESCRIPTION

This module exports a single function C<linetime> that tries to find
a date-timestamp in a line and returns the UNIX timestamp that corresponds
to it (or 0 if it couldn't find anything).

The argument to C<linetime> defaults to C<$_>, which makes it
especially useful to use in one-liners (see the synopsis above).

=cut
