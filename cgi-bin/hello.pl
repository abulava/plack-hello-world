#!/usr/bin/perl
use strict;
use warnings;

use CGI;
my $q = CGI->new;
print $q->header;

print "<html>";

print "<head>";
print '<base href="/">';
print '<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">';
print '<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">';
print '<link rel="stylesheet" href="/css/hello.css">';
print "</head>";

print "<body>";
print "<p>Hello World!</p>";
print "</body>";

print "</html>";
