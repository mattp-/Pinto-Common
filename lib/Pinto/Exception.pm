# ABSTRACT: Base class for Pinto exceptions

package Pinto::Exception;

use Moose;
use Moose::Exporter;

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

extends 'Throwable::Error';

#------------------------------------------------------------------------------

Moose::Exporter->setup_import_methods( as_is => [ throw => \&throw ] );

#------------------------------------------------------------------------------
# HACK: I'm not sure this will work with subclasses

=func throw( $message )

Throws an exception (of this class) with the given message.

=cut

sub throw { return __PACKAGE__->SUPER::throw(@_) }

#------------------------------------------------------------------------------

__PACKAGE__->meta->make_immutable( inline_constructor => 0 );

#------------------------------------------------------------------------------
1;

__END__
