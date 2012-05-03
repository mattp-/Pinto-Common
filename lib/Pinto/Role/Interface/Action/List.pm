# ABSTRACT: Interface for Action::List

package Pinto::Role::Interface::Action::List;

use Moose::Role;
use MooseX::Types::Moose qw(Str Bool);

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

with qw( Pinto::Role::Interface::Action
         Pinto::Role::Attribute::out
         Pinto::Role::Attribute::stack );

#------------------------------------------------------------------------------

has format => (
    is        => 'ro',
    isa       => Str,
    default   => "%m%s%y %-40n %12v  %p\n",
    predicate => 'has_format',
    lazy      => 1,
);


has pinned => (
    is     => 'ro',
    isa    => Bool,
);


has packages => (
    is     => 'ro',
    isa    => Str,
);


has distributions => (
    is     => 'ro',
    isa    => Str,
);

#------------------------------------------------------------------------------

1;

__END__
