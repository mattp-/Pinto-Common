# ABSTRACT: Interface for Action::New

package Pinto::Role::Interface::Action::New;

use Moose::Role;
use MooseX::Types::Moose qw(Str);

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

#------------------------------------------------------------------------------
1;

__END__
