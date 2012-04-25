# ABSTRACT: Something that has a distribution path attribute

package Pinto::Role::Attribute::path;

use Moose::Role;

use MooseX::Types::Moose qw( Str );

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

with qw( Pinto::Meta::Attribute::Trait::Postable );

#------------------------------------------------------------------------------
# Attributes

has path  => (
    is       => 'ro',
    isa      => Str,
    required => 1,
    traits   => [ qw(Postable) ],
);

#------------------------------------------------------------------------------

1;

__END__
