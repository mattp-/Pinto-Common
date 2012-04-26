# ABSTRACT: Something that has a username attribute

package Pinto::Role::Attribute::username;

use Moose::Role;

use MooseX::Types::Moose qw(Str);

use Carp;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

has username => (
    is         => 'ro',
    isa        => Str,
    lazy       => 1,
    builder    => '_build_username',
);

#------------------------------------------------------------------------------

sub _build_username {
    my ($self) = @_;

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

