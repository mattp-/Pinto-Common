# ABSTRACT: Interface for Action::Unpin

package Pinto::Role::Interface::Action::Unpin;

use Moose::Role;

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

with qw( Pinto::Role::Interface::Action
         Pinto::Role::Attribute::package );

#------------------------------------------------------------------------------

1;

__END__
