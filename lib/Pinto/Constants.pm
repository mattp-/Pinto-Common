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
    $PINTO_SERVER_TEST_ROOT

    $PINTO_REPOSITORY_ROOT_ENV_VAR
);

#------------------------------------------------------------------------------

Readonly our $PINTO_SERVER_DEFAULT_PORT => 3111;

Readonly our $PINTO_SERVER_DEFAULT_HOST => 'localhost';

Readonly our $PINTO_SERVER_DEFAULT_ROOT  =>
  "http://$PINTO_SERVER_DEFAULT_HOST:$PINTO_SERVER_DEFAULT_PORT";

Readonly our $PINTO_SERVER_TEST_PORT => 3321;

Readonly our $PINTO_SERVER_TEST_ROOT =>
  "http://$PINTO_SERVER_DEFAULT_HOST:$PINTO_SERVER_TEST_PORT";

Readonly our $PINTO_REPOSITORY_ROOT_ENV_VAR  => 'PINTO_REPOSITORY_ROOT';

#------------------------------------------------------------------------------
1;

__END__
