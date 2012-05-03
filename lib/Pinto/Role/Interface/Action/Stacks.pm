# ABSTRACT: Interface for Action::Stacks

package Pinto::Role::Interface::Action::Stacks;

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
    default => "%M %-16k %-16j %U\n",
);

#------------------------------------------------------------------------------

1;

__END__
