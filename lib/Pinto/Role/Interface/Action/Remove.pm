# ABSTRACT: Interface for Action::Remove

package Pinto::Interface::Action::Remove;

use Moose::Role;

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

with qw( Pinto::Attribute::path
         Pinto::Attribute::author );

#------------------------------------------------------------------------------

1;

__END__
