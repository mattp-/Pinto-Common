# ABSTRACT: Interface for Action::Import

package Pinto::Role::Interface::Action::Import;

use Moose::Role;

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

with qw( Pinto::Role::Interface::Action
         Pinto::Role::Attribute::target
         Pinto::Role::Attribute::norecurse );

#------------------------------------------------------------------------------

1;

__END__
