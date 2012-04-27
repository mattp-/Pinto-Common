# ABSTRACT: Interface for Action::List

package Pinto::Role::Interface::Action::List;

use Moose::Role;
use MooseX::Types::Moose qw(Str Bool);

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

with qw( Pinto::Role::Interface::Action
         Pinto::Role::Attribute::out
         Pinto::Role::Attribute::stack );

#------------------------------------------------------------------------------

has format => (
    is      => 'ro',
    isa     => Str,
);


has pinned => (
    is     => 'ro',
    isa    => Bool,
);


has packages => (
    is     => 'ro',
    isa    => Str,
);


has distributions => (
    is     => 'ro',
    isa    => Str,
);

#------------------------------------------------------------------------------

1;

__END__
