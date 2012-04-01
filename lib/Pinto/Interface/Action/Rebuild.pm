# ABSTRACT: Interface for Action::Rebuild

package Pinto::Interface::Action::Rebuild;

use Moose::Role;

use MooseX::Types::Moose qw(Bool);

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

with qw( Pinto::Meta::Attribute::Trait::Postable );

#------------------------------------------------------------------------------

has recompute => (
    is      => 'ro',
    isa     => Bool,
    default => 0,
    traits  => [ qw(Postable) ],
);

#------------------------------------------------------------------------------
1;

__END__
