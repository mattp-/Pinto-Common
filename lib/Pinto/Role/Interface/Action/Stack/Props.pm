# ABSTRACT: Interface for Action::Stack::Props

package Pinto::Role::Interface::Action::Stack::Props;

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
    default => "%n = %v\n",
);

#------------------------------------------------------------------------------

1;

__END__
