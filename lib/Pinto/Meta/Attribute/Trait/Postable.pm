# ABSTRACT: Attribute trait to mark them as something to POST

package Pinto::Meta::Attribute::Trait::Postable;

use Moose::Role;
use MooseX::Types::Moose qw(Str CodeRef);

use namespace::autoclean;

#-----------------------------------------------------------------------------

# VERSION

#-----------------------------------------------------------------------------

=attr post_as => NAME

Specify an alternative name for the attribute when posting it.
If not specified, the posted attribute name will be the same
as the object attribute name.

=cut

has post_as => (
    is       => 'ro',
    isa      => Str,
);

=attr post_via => CODEREF

Specify an alternative subroutine for transforming the attribute value
before posting it.  If not specified, the posted value will be the
same as the attribute value.

=cut

has post_via => (
   is        => 'ro',
   isa       => CodeRef,
);

#-----------------------------------------------------------------------------

=method as_post_data()

Returns an array reference containing the names => values of each
C<Postable> attribute of this object.  This array reference is
suitable for passing to the C<POST> function in
L<HTTP::Request::Common> or the C<post> method of L<LWP::UserAgent>.

=cut

sub as_post_data {
    my ($self) = @_;

    my @post_data;
    for my $attribute ( $self->meta->get_all_attributes ) {

        next if not $attribute->does( __PACKAGE__ );

        my $key   = $attribute->post_as()  || $attribute->name();
        my $via   = $attribute->post_via() || $attribute->get_read_method();
        my $value = $self->$via();

        next if not defined $value;

        push @post_data, $key, $value;
    }

    return \@post_data;
}

#-----------------------------------------------------------------------------

package # hide
    Moose::Meta::Attribute::Custom::Trait::Postable;

sub register_implementation { 'Pinto::Meta::Attribute::Trait::Postable' }

#-----------------------------------------------------------------------------
1;

__END__
