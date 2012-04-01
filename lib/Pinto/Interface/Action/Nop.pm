# ABSTRACT: Interface for Action::Nop;

package Pinto::Interface::Action::Nop;

use Moose::Role;

use MooseX::Types::Moose qw(Int);

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

with qw( Pinto::Meta::Attribute::Trait::Postable );

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
