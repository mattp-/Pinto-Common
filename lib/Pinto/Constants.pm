package Pinto::Constants;

# ABSTRACT: Constants used across the Pinto utilities

use strict;
use warnings;

use Readonly;

use base 'Exporter';

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------
# TODO: Most of these constants are defunct.  They are left over from prior
# versions of Pinto.  Almost all of them can probably be removed.
#------------------------------------------------------------------------------

Readonly our @EXPORT_OK => qw(
    @PINTO_LIST_TYPES
    $PINTO_LIST_TYPES_STRING

    $PINTO_DEFAULT_LIST_TYPE

    $PINTO_ACTION_TYPE_ADD
    $PINTO_ACTION_TYPE_CLEAN
    $PINTO_ACTION_TYPE_LIST
    $PINTO_ACTION_TYPE_NOP
    $PINTO_ACTION_TYPE_REBUILD
    $PINTO_ACTION_TYPE_REMOVE
    $PINTO_ACTION_TYPE_UPDATE
    $PINTO_ACTION_TYPE_VERIFY

    $PINTO_SERVER_DEFAULT_PORT
    $PINTO_SERVER_DEFAULT_HOST
    $PINTO_SERVER_DEFAULT_ROOT
    $PINTO_SERVER_TEST_PORT
    $PINTO_SERVER_TEST_ROOT

    $PINTO_REPOSITORY_ROOT_ENV_VAR
);

#------------------------------------------------------------------------------

Readonly our %EXPORT_TAGS => ( 
    list   => [ qw ( @PINTO_LIST_TYPES
                     $PINTO_LIST_TYPES_STRING
                     $PINTO_DEFAULT_LIST_TYPE ) ],

    action => [ qw(  $PINTO_LIST_TYPES_STRING
                     $PINTO_DEFAULT_LIST_TYPE
                     $PINTO_ACTION_TYPE_ADD
                     $PINTO_ACTION_TYPE_CLEAN
                     $PINTO_ACTION_TYPE_LIST
                     $PINTO_ACTION_TYPE_NOP
                     $PINTO_ACTION_TYPE_REBUILD
                     $PINTO_ACTION_TYPE_REMOVE
                     $PINTO_ACTION_TYPE_UPDATE
                     $PINTO_ACTION_TYPE_VERIFY ) ],
);

#------------------------------------------------------------------------------

Readonly our @PINTO_LIST_TYPES => qw(local foreign conflicts all);
Readonly our $PINTO_LIST_TYPES_STRING => join ' | ', sort @PINTO_LIST_TYPES;
Readonly our $PINTO_DEFAULT_LIST_TYPE => 'all';

#------------------------------------------------------------------------------

Readonly our $PINTO_ACTION_TYPE_ADD     => 'Add';
Readonly our $PINTO_ACTION_TYPE_CLEAN   => 'Clean';
Readonly our $PINTO_ACTION_TYPE_LIST    => 'List';
Readonly our $PINTO_ACTION_TYPE_NOP     => 'Nop';
Readonly our $PINTO_ACTION_TYPE_REBUILD => 'Rebuild';
Readonly our $PINTO_ACTION_TYPE_REMOVE  => 'Remove';
Readonly our $PINTO_ACTION_TYPE_UPDATE  => 'Update';
Readonly our $PINTO_ACTION_TYPE_VERIFY  => 'Verify';

#------------------------------------------------------------------------------

Readonly our $PINTO_SERVER_DEFAULT_PORT => 3111;
Readonly our $PINTO_SERVER_DEFAULT_HOST => 'localhost';

Readonly our $PINTO_SERVER_DEFAULT_ROOT  =>
  "http://$PINTO_SERVER_DEFAULT_HOST:$PINTO_SERVER_DEFAULT_PORT";

Readonly our $PINTO_SERVER_TEST_PORT => 3321;

Readonly our $PINTO_SERVER_TEST_ROOT =>
  "http://$PINTO_SERVER_DEFAULT_HOST:$PINTO_SERVER_TEST_PORT";

#------------------------------------------------------------------------------

Readonly our $PINTO_REPOSITORY_ROOT_ENV_VAR  => 'PINTO_REPOSITORY_ROOT';

#------------------------------------------------------------------------------
1;

__END__
