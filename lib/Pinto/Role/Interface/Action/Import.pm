# ABSTRACT: Interface for Action::Import

package Pinto::Role::Interface::Action::Import;

use Moose::Role;

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

with qw( Pinto::Role::Interface::Action
         Pinto::Role::Attribute::package
         Pinto::Role::Attribute::version
         Pinto::Role::Attribute::norecurse );

#------------------------------------------------------------------------------

1;

__END__
