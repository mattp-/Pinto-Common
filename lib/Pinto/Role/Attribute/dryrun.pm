# ABSTRACT: Something that has a dryrun attribute

package Pinto::Role::Attribute::dryrun;

use Moose::Role;

use MooseX::Types::Moose qw(Bool);

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

has dryrun => (
    is        => 'ro',
    isa       => Bool,
    default   => 0,
);

#------------------------------------------------------------------------------

1;

__END__
