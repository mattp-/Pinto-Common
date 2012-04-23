# ABSTRACT: Interface for Action::List

package Pinto::Role::Interface::Action::List;

use Moose::Role;

use MooseX::Types::Moose qw(Maybe Str Bool HashRef);

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


has index => (
    is     => 'ro',
    isa    => Str,
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


has where => (
    is      => 'ro',
    isa     => HashRef,
    builder => '_build_where',
    lazy    => 1,
);

#------------------------------------------------------------------------------

1;

__END__
