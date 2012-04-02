# ABSTRACT: Something that has an author id attriubte

package Pinto::Attribute::author;

use Moose::Role;

use Carp;

use Pinto::Types qw(AuthorID);

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

with qw( Pinto::Attribute::pausecfg
         Pinto::Attribute::username
         Pinto::Meta::Attribute::Trait::Postable );

#------------------------------------------------------------------------------

has author => (
    is         => 'ro',
    isa        => AuthorID,
    coerce     => 1,
    lazy       => 1,
    builder    => '_build_author',
    traits     => [ qw(Postable) ],
);

#------------------------------------------------------------------------------

sub _build_author {
    my ($self) = @_;

    # Try looking in their .pause file
    my $pause_id = $self->pausecfg->{user};
    return uc $pause_id if $pause_id;

    # Fall back to username
    return uc $self->username;
}

#------------------------------------------------------------------------------
1;

__END__

