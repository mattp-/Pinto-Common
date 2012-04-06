package Pinto::Constants;

# ABSTRACT: Constants used across the Pinto utilities

use strict;
use warnings;

use Readonly;

use base 'Exporter';

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

Readonly our @EXPORT_OK => qw(

    $PINTO_SERVER_DEFAULT_PORT
    $PINTO_SERVER_DEFAULT_HOST
    $PINTO_SERVER_DEFAULT_ROOT

    $PINTO_SERVER_TEST_PORT
    $PINTO_SERVER_TEST_HOST
    $PINTO_SERVER_TEST_ROOT

    $PINTO_SERVER_RESPONSE_PROLOGUE
    $PINTO_SERVER_RESPONSE_EPILOGUE
    $PINTO_SERVER_RESPONSE_LINE_PREFIX

    $PINTO_DEFAULT_LOG_COLORS

    $PINTO_REPOSITORY_ROOT_ENV_VAR
);

Readonly our %EXPORT_TAGS => ( all => \@EXPORT_OK );

#------------------------------------------------------------------------------

Readonly our $PINTO_SERVER_DEFAULT_HOST => 'localhost';

Readonly our $PINTO_SERVER_DEFAULT_PORT => 3111;

Readonly our $PINTO_SERVER_DEFAULT_ROOT  =>
  "http://$PINTO_SERVER_DEFAULT_HOST:$PINTO_SERVER_DEFAULT_PORT";

#------------------------------------------------------------------------------

Readonly our $PINTO_SERVER_TEST_HOST => 'localhost';

Readonly our $PINTO_SERVER_TEST_PORT => 3321;

Readonly our $PINTO_SERVER_TEST_ROOT =>
  "http://$PINTO_SERVER_TEST_HOST:$PINTO_SERVER_TEST_PORT";

#------------------------------------------------------------------------------

Readonly our $PINTO_SERVER_RESPONSE_LINE_PREFIX => 'SERVER: ';

Readonly our $PINTO_SERVER_RESPONSE_PROLOGUE =>
    "${PINTO_SERVER_RESPONSE_LINE_PREFIX}Protocol: 0.01";

Readonly our $PINTO_SERVER_RESPONSE_EPILOGUE =>
    "${PINTO_SERVER_RESPONSE_LINE_PREFIX}Status: ok";

#------------------------------------------------------------------------------

my $COLOR_NORMAL      => { text => undef,    background => undef };
my $COLOR_BOLD_YELLOW => { text => 'yellow', background => undef, bold => 1 };
my $COLOR_BOLD_RED    => { text => 'red',    background => undef, bold => 1 };

Readonly our $PINTO_DEFAULT_LOG_COLORS => { debug    => $COLOR_NORMAL,
                                            info     => $COLOR_NORMAL,
                                            notice   => $COLOR_NORMAL,
                                            warning  => $COLOR_BOLD_YELLOW,
                                            error    => $COLOR_BOLD_RED,
                                            critical => $COLOR_BOLD_RED };


#------------------------------------------------------------------------------

Readonly our $PINTO_REPOSITORY_ROOT_ENV_VAR  => 'PINTO_REPOSITORY_ROOT';

#------------------------------------------------------------------------------
1;

__END__
