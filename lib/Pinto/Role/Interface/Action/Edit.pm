# ABSTRACT: Interface for Action::Edit

package Pinto::Role::Interface::Action::Edit;

use Moose::Role;
use MooseX::Types::Moose qw(Str HashRef Bool);

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

with qw( Pinto::Role::Interface::Action );

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


has default => (
  is      => 'ro',
  isa     => Bool,
  default => 0,
);


#------------------------------------------------------------------------------

1;

__END__
