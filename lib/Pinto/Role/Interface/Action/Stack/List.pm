# ABSTRACT: Interface for Action::Stack::List

package Pinto::Role::Interface::Action::Stack::List;

use Moose::Role;
use MooseX::Types::Moose qw(Str);

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

with qw( Pinto::Role::Interface::Action
         Pinto::Role::Attribute::out );

#------------------------------------------------------------------------------

has format => (
    is      => 'ro',
    isa     => Str,
    default => "%M%12k: %e (last modified: %U)\n",
);

#------------------------------------------------------------------------------

1;

__END__
