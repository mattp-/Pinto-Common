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
is($t->author, 'HELLO', 'Coerced Author from string');
throws_ok {$t->author('foo bar!') } qr/alphanumeric/, 'Author must be alphanumeric';
throws_ok {$t->author('') } qr/alphanumeric/, 'Author must have length';

$t->stack('MyStack');
is($t->stack, 'mystack', 'Coerced StackName from string');
throws_ok {$t->stack('foo bar!') } qr/alphanumeric/, 'StackName must be alphanumeric';
throws_ok {$t->stack('') } qr/alphanumeric/, 'StackName must have length';

$t->stack('MyProperty');
is($t->stack, 'myproperty', 'Coerced PropertyName from string');
throws_ok {$t->property('foo bar!') } qr/alphanumeric/, 'PropertyName must be alphanumeric';
throws_ok {$t->property('') } qr/alphanumeric/, 'PropertyName must have length';

$t->version(5.1);
is(ref $t->version, 'version', 'Coerced version from number');

$t->version('5.1.2');
is(ref $t->version, 'version', 'Coerced version from string');

$t->version('v5.1.2');
is(ref $t->version, 'version', 'Coerced version from v-string');

$t->pkg('Foo-0.01');
is(ref $t->pkg, 'Pinto::PackageSpec', 'Coerced PackageSpec from string');
is($t->pkg->name, 'Foo', 'PackageSpec has correct name');
is($t->pkg->version, '0.01', 'PackageSpec has correct version');

$t->dist('author/subdir/Dist-1.0.tar.gz');
is(ref $t->dist, 'Pinto::DistributionSpec', 'Coerced DistributionSpec from string');
is($t->dist->author, 'AUTHOR', 'DistributionSpec has correct author');
is_deeply($t->dist->subdirs, ['subdir'], 'DistribiutionsSpec has correct subdirs');
is($t->dist->archive, 'Dist-1.0.tar.gz', 'DistribiutionsSpec has correct archive');

$t->targets('author/subdir/Dist-1.0.tar.gz');
is(ref $t->targets, 'ARRAY', 'Coerced ArrayRef from string');
is(ref $t->targets->[0], 'Pinto::DistributionSpec', 'Coereced DistributionSpec from string');

$t->targets( ['Foo-1.2', 'author/subdir/Dist-1.0.tar.gz'] );
is(ref $t->targets->[0], 'Pinto::PackageSpec',      'Coerced PackageSpec in array');
is(ref $t->targets->[1], 'Pinto::DistributionSpec', 'Coereced DistributionSpec in array');

$t->targets( ['Foo'] );
is(ref $t->targets->[0], 'Pinto::PackageSpec',      'Coerced PackageSpec in array');

#-----------------------------------------------------------------------------

done_testing;
