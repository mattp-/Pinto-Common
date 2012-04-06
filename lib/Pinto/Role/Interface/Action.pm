# ABSTRACT: Base interface for all Actions

package Pinto::Role::Interface::Action;

use Moose::Role;

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

requires qw(execute);

#------------------------------------------------------------------------------

1;

__END__
