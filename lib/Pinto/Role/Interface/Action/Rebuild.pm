# ABSTRACT: Interface for Action::Rebuild

package Pinto::Role::Interface::Action::Rebuild;

use Moose::Role;

use MooseX::Types::Moose qw(Bool);

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

with qw( Pinto::Role::Interface::Action
         Pinto::Meta::Attribute::Trait::Postable );

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
