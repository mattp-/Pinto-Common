# ABSTRACT: Interface for Action::Nop;

package Pinto::Role::Interface::Action::Nop;

use Moose::Role;

use MooseX::Types::Moose qw(Int);

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

with qw( Pinto::Role::Interface::Action
         Pinto::Meta::Attribute::Trait::Postable );

#------------------------------------------------------------------------------

has sleep => (
    is      => 'ro',
    isa     => Int,
    default => 0,
    traits  => [ qw(Postable) ],
);

#------------------------------------------------------------------------------

1;

__END__
