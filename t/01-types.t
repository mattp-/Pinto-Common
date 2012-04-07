#!perl


use strict;
use warnings;

use Test::More;
use Test::Exception;

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
throws_ok {$t->author('foo bar!') } qr/alphanumeric/, 'AuthorID type constraint';

$t->stack('ProD');
is($t->stack, 'prod', 'Coerced stack name from string');
throws_ok {$t->stack('foo bar!') } qr/alphanumeric/, 'StackName type constraint';

$t->version(5.1);
is(ref $t->version, 'version', 'Coerced version from number');

$t->version('5.1.2');
is(ref $t->version, 'version', 'Coerced version from string');

$t->version('v5.1.2');
is(ref $t->version, 'version', 'Coerced version from v-string');

lives_ok { $t->log_level('notice') } 'Valid LogLevel';
throws_ok {$t->log_level('bogus') } qr/must be one of/, 'LogLevel type constraint';

#-----------------------------------------------------------------------------

done_testing();
