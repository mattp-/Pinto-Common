# ABSTRACT: Something that has an author id attriubte

package Pinto::Attribute::author;

use Moose::Role;

use Carp;

use Pinto::Types qw(AuthorID);

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

with qw( Pinto::Attribute::pausecfg
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
    return $pause_id if $pause_id;

    # Look at typical environment variables
    for my $env_var ( qw(USER USERNAME LOGNAME) ) {
        return $ENV{$env_var} if $ENV{$env_var};
    }

    # Try using pwent.  Probably only works on *nix
    if (my $name = getpwuid($<)) {
        return uc $name;
    }

    # Otherwise, we are hosed!
    confess 'Unable to determine your username';

}

#------------------------------------------------------------------------------
1;

__END__

