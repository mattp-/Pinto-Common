# ABSTRACT: Interface for Action::Props

package Pinto::Role::Interface::Action::Props;

use Moose::Role;
use MooseX::Types::Moose qw(Str);

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

with qw( Pinto::Role::Interface::Action
         Pinto::Role::Attribute::out );

#------------------------------------------------------------------------------

has stack  => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


has format => (
    is      => 'ro',
    isa     => Str,
    default => "%n = %v\n",
);

#------------------------------------------------------------------------------

1;

__END__
