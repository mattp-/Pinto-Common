# ABSTRACT: Something that has a distribution archive attribute

package Pinto::Role::Attribute::archives;

use Moose::Role;
use MooseX::Types::Moose qw(ArrayRef);
use Pinto::Types qw( File );

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

has archives  => (
    is       => 'ro',
    isa      => ArrayRef[File],
    coerce   => 1,
    required => 1,
    traits   => [ qw(Array) ],
    handles  => {archives => 'elements'}
);

#------------------------------------------------------------------------------

1;

__END__
