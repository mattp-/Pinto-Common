# ABSTRACT: Interface for Action::Pin

package Pinto::Interface::Action::Pin;

use Moose::Role;

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

with qw( Pinto::Attribute::package
         Pinto::Attribute::version );

#------------------------------------------------------------------------------

1;

__END__
