# ABSTRACT: Something that has a stack attribute

package Pinto::Role::Attribute::stack;

use Moose::Role;
use MooseX::Types::Moose qw(Str);

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

has stack => (
    is       => 'ro',
    isa      => Str,
);

#------------------------------------------------------------------------------

1;

__END__
