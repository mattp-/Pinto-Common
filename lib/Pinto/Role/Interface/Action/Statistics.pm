# ABSTRACT: Interface for Action::Statistics

package Pinto::Role::Interface::Action::Statistics;

use Moose::Role;

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

with qw( Pinto::Role::Interface::Action
         Pinto::Role::Attribute::out );

#------------------------------------------------------------------------------

1;

__END__
