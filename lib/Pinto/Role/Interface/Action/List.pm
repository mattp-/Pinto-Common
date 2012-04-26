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
         Pinto::Role::Attribute::stack
         Pinto::Meta::Attribute::Trait::Postable );

#------------------------------------------------------------------------------

has format => (
    is      => 'ro',
    isa     => Str,
    traits  => [ qw(Postable) ],
);


has pinned => (
    is     => 'ro',
    isa    => Bool,
    traits => [ qw(Postable) ],
);


has packages => (
    is     => 'ro',
    isa    => Str,
    traits => [ qw(Postable) ],
);


has distributions => (
    is     => 'ro',
    isa    => Str,
    traits => [ qw(Postable) ],
);

#------------------------------------------------------------------------------

1;

__END__
