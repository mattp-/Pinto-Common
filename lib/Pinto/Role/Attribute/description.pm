# ABSTRACT: Something that has a description attribute

package Pinto::Role::Attribute::description;

use Moose::Role;
use MooseX::Types::Moose qw(Str);

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

has description => (
    is         => 'ro',
    isa        => Str,
    predicate  => 'has_description',
);

#------------------------------------------------------------------------------
1;

__END__

