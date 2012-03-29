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

    $PINTO_DEFAULT_SERVER_PORT
    $PINTO_DEFAULT_SERVER_HOST
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

Readonly our $PINTO_DEFAULT_SERVER_PORT  => '3111';
Readonly our $PINTO_DEFAULT_SERVER_HOST  => 'localhost';

#------------------------------------------------------------------------------
1;

__END__
