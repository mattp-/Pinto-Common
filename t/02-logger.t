#!perl

use strict;
use warnings;

use Test::More (tests => 3);

use Pinto::Config;
use Pinto::Logger;

#-----------------------------------------------------------------------------

my $buffer = '';
my $config = Pinto::Config->new( quiet => 0, log_level => 0 );
my $logger = Pinto::Logger->new( config => $config, out => \$buffer );

$logger->debug("debug");
is($buffer, '', 'debug message not logged');

$logger->info("info");
like($buffer, qr/info/, 'info message was logged');

$logger->whine("whine");
like($buffer, qr/info/, 'whine message was logged');
