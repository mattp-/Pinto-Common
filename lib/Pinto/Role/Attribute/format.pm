# ABSTRACT: Something that has a format attribute

package Pinto::Role::Attribute::format;

use Moose::Role;

use MooseX::Types::Moose qw( Str );

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

with qw( Pinto::Meta::Attribute::Trait::Postable );

#------------------------------------------------------------------------------
# Attributes

has format   => (
    is       => 'ro',
    isa      => Str,
    required => 1,
    traits   => [ qw(Postable) ],
);

#------------------------------------------------------------------------------

1;

__END__
