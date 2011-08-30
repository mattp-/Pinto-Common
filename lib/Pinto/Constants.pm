package Pinto::Constants;

# ABSTRACT: Constants used across the Pinto utilities

use strict;
use warnings;

use Readonly;

use base 'Exporter';

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

Readonly our @EXPORT_OK => qw( @PINTO_LIST_TYPES
                               $PINTO_LIST_TYPES_STRING
                               $PINTO_DEFAULT_LIST_TYPE );

Readonly our %EXPORT_TAGS => ( list => [ qw ( @PINTO_LIST_TYPES
                                              $PINTO_LIST_TYPES_STRING
                                              $PINTO_DEFAULT_LIST_TYPE ) ] );

#------------------------------------------------------------------------------

Readonly our @PINTO_LIST_TYPES => qw(local foreign conflicts all);
Readonly our $PINTO_LIST_TYPES_STRING => join ' | ', sort @PINTO_LIST_TYPES;
Readonly our $PINTO_DEFAULT_LIST_TYPE => 'all';

#------------------------------------------------------------------------------
1;

__END__
