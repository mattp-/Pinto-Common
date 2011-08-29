package Pinto::Constants;

# ABSTRACT: Constants used across the pinto-* utilities

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

Readonly my @PINTO_LIST_TYPES => qw(local foreign conflicts all);
Readonly my $PINTO_LIST_TYPES_STRING => join ' | ', sort @PINTO_LIST_TYPES;
Readonly my $PINTO_DEFAULT_LIST_TYPE => 'all';

#------------------------------------------------------------------------------
1;

__END__
