# ABSTRACT: Interface for Action::Import

package Pinto::Interface::Action::Import;

use Moose::Role;

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

with qw( Pinto::Attribute::package
         Pinto::Attribute::version
         Pinto::Attribute::norecurse );

#------------------------------------------------------------------------------

1;

__END__
