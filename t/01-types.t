#!perl


use strict;
use warnings;

use Test::More (tests => 4);

use Path::Class;
use FindBin qw($Bin);
use lib dir($Bin, 'lib')->stringify();

use TestClass;

#-----------------------------------------------------------------------------

my $t = TestClass->new();

$t->file('foo/bar/baz');
is(ref $t->file(), 'Path::Class::File', 'Coerced file from string');

$t->dir('foo/bar/baz');
is(ref $t->dir(), 'Path::Class::Dir', 'Coerced dir from string');

$t->uri('http://nuts');
is(ref $t->uri(), 'URI::http', 'Coerced URI from string');


$t->author('hello');
is($t->author, 'HELLO', 'Coerced Author ID from string');

#-----------------------------------------------------------------------------


