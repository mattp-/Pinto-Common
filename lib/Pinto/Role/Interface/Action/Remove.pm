# ABSTRACT: Interface for Action::Remove

package Pinto::Role::Interface::Action::Remove;

use Moose::Role;

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

with qw( Pinto::Role::Interface::Action
         Pinto::Role::Attribute::path
         Pinto::Role::Attribute::author );

#------------------------------------------------------------------------------

1;

__END__
