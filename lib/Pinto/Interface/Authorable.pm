# ABSTRACT: Something that has an author id

package Pinto::Interface::Authorable;

use Moose::Role;

use Carp;

use Pinto::Types qw(AuthorID);

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

has author => (
    is         => 'ro',
    isa        => AuthorID,
    coerce     => 1,
    lazy       => 1,
    builder    => '_build_author',
);

#------------------------------------------------------------------------------

with qw(Pinto::Interface::PauseConfig);

#------------------------------------------------------------------------------

sub _build_author {
    my ($self) = @_;

    # Try looking in their .pause file
    my $pause_id = $self->pausecfg->{user};
    return $pause_id if $pause_id;

    # Look at typical environment variables
    for my $var ( qw(USER USERNAME LOGNAME) ) {
        return $ENV{$var} if $ENV{$var};
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

