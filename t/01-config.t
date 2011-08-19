#!perl

use strict;
use warnings;

use Test::More (tests => 24);
use Test::Exception;

use Path::Class;
use File::HomeDir;
use File::Temp;

use Pinto::Config;


#------------------------------------------------------------------------------

{
    no warnings 'redefine';
    local *Pinto::Config::_build_config_file = sub{};
    local *Pinto::Config::_build_author = sub{ 'TEST' };

    my %default_cases = (
        repos     => 'nowhere',
        source    => 'http://cpan.perl.org',
        author    => 'TEST',
        force     => 0,
        verbose   => 0,
        quiet     => 0,
        store     => 'Pinto::Store',
        nocleanup => 0,
        nocommit  => 0,
    );

    my $cfg = Pinto::Config->new(repos => 'nowhere');
    while ( my ($method, $expect) = each %default_cases ) {
        my $msg = "Got default value for '$method'";
        is($cfg->$method(), $expect, $msg);
    }

   my %custom_cases = (
        repos     => 'nowhere',
        source    => 'http://cpan.pair.com',
        author    => 'TEST',
        force     => 1,
        verbose   => 1,
        quiet     => 1,
        store     => 'Pinto::Store::Git',
        nocleanup => 1,
        nocommit  => 1,
    );

    $cfg = Pinto::Config->new(%custom_cases);
    while ( my ($method, $expect) = each %custom_cases ) {
        my $msg = "Got custom value for '$method'";
        is($cfg->$method(), $expect, $msg);
    }

    $cfg = Pinto::Config->new(repos => '~/nowhere');
    my $home = dir( File::HomeDir->my_home() );
    is($cfg->repos(), $home->file('nowhere'), 'Expanded ~/ to home directory');

    $cfg = Pinto::Config->new(repos => 'nowhere', author => 'fooBar');
    is($cfg->author(), 'FOOBAR', 'Coerced author to ALL CAPS');

    throws_ok { Pinto::Config->new(repos => 'nowhere', author => 'foo Bar') }
        qr/must be alphanumeric/, 'Author cannot have funky characters';

    throws_ok { Pinto::Config->new()->repos() }
        qr/does not pass the type constraint/, 'repos parameter is required';
}


#------------------------------------------------------------------------------

{

    no warnings 'redefine';
    local *Pinto::Config::_build_config_file = sub{};
    local $ENV{USERNAME} = 'SpECIaL';
    my $cfg = Pinto::Config->new();
    is($cfg->author(), 'SPECIAL', 'Got author from ENV');
}

#------------------------------------------------------------------------------

{
    my $tmp = File::Temp->new();
    my $name = $tmp->filename();
    local $ENV{PERL_PINTO} = $name;
    my $cfg = Pinto::Config->new(repos => 'nowhere');
    is($cfg->config_file(), $name, 'Got config_file from ENV');
}

#------------------------------------------------------------------------------
