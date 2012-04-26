# ABSTRACT: Interface for Action::Stack::Create

package Pinto::Role::Interface::Action::Stack::Create;

use Moose::Role;
use MooseX::Types::Moose qw(Str);

use Pinto::Types qw(StackName);

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

with qw( Pinto::Role::Interface::Action );

#------------------------------------------------------------------------------

has stack => (
   is       => 'ro',
   isa      => StackName,
   coerce   => 1,
   required => 1,
);


has description => (
    is      => 'ro',
    isa     => Str,
    default => 'no description was given',
);

#------------------------------------------------------------------------------

1;

__END__
