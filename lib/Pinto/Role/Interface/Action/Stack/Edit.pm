# ABSTRACT: Interface for Action::Stack::Edit

package Pinto::Role::Interface::Action::Stack::Edit;

use Moose::Role;
use MooseX::Types::Moose qw(Str HashRef);

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

with qw( Pinto::Role::Interface::Action
         Pinto::Role::Attribute::description );

#------------------------------------------------------------------------------

has stack => (
    is       => 'ro',
    isa      => Str,
    required => 1,
);


has properties => (
    is      => 'ro',
    isa     => HashRef,
    default => sub{ {} },
);

#------------------------------------------------------------------------------

1;

__END__
