# ABSTRACT: Interface for Action::Copy

package Pinto::Role::Interface::Action::Copy;

use Moose::Role;
use MooseX::Types::Moose qw(Str);

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

with qw( Pinto::Role::Interface::Action
         Pinto::Role::Attribute::dryrun );

#------------------------------------------------------------------------------


has from_stack => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


has to_stack => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);

#------------------------------------------------------------------------------

1;

__END__
