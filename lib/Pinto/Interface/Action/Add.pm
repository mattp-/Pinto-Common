# ABSTRACT: Interface for Action::Add

package Pinto::Interface::Action::Add;

use Moose::Role;

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

with qw( Pinto::Attribute::author
         Pinto::Attribute::archive
         Pinto::Attribute::norecurse );

#------------------------------------------------------------------------------

1;

__END__
