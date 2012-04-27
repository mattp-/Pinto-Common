# ABSTRACT: Something that has a target attribute

package Pinto::Role::Attribute::targets;

use Moose::Role;

use Pinto::Types qw(ArrayRefOfPkgsOrDists);

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

has targets => (
    isa      => ArrayRefOfPkgsOrDists,
    traits   => [ qw(Array) ],
    handles  => {targets => 'elements'},
    required => 1,
    coerce   => 1,
);

#------------------------------------------------------------------------------

1;

__END__
