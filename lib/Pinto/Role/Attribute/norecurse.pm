# ABSTRACT: Something that has a norecurse attribute

package Pinto::Role::Attribute::norecurse;

use Moose::Role;

use MooseX::Types::Moose qw(Bool);

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

with qw( Pinto::Meta::Attribute::Trait::Postable );

#------------------------------------------------------------------------------

has norecurse => (
    is        => 'ro',
    isa       => Bool,
    default   => 0,
    traits    => [ qw(Postable) ],
);

#------------------------------------------------------------------------------

1;

__END__
