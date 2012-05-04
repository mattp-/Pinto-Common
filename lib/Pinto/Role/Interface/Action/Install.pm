# ABSTRACT: Interface for Action::Install

package Pinto::Role::Interface::Action::Install;

use Moose::Role;
use MooseX::Types::Moose qw(HashRef ArrayRef Str);

use File::Which qw(which);

use Pinto::Exception qw(throw);

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

with qw( Pinto::Role::Interface::Action );

#------------------------------------------------------------------------------

has cpanm_options => (
    is      => 'ro',
    isa     => HashRef[Str],
    default => sub { {} },
    lazy    => 1,
);


has cpanm_exe => (
    is      => 'ro',
    isa     => Str,
    default => sub { which('cpanm') || '' },
    lazy    => 1,
);


has stack   => (
    is      => 'ro',
    isa     => Str,
);


has targets => (
    is      => 'ro',
    isa     => ArrayRef[Str],
    default => sub { [] },
    lazy    => 1,
);

#------------------------------------------------------------------------------

sub BUILD {}

before BUILD => sub {
    my ($self, @args) = @_;

    my $cpanm_exe = $self->cpanm_exe
      or throw 'Must have cpanm to do install';

    my $cpanm_version_cmd = "$cpanm_exe --version";
    my $cpanm_version_cmd_output = qx{$cpanm_version_cmd};
    throw "Could not learn version of cpanm: $!" if $?;

    my ($cpanm_version) = $cpanm_version_cmd_output =~ m{version ([\d.]+)}
      or throw "Could not parse cpanm version number from $cpanm_version_cmd_output";

    my $min_cpanm_version = '1.500';
    if ($cpanm_version < $min_cpanm_version) {
      throw "Your cpanm ($cpanm_version) is too old.  Must have ($min_cpanm_version) or newer";
    }

    return $self;
};

#------------------------------------------------------------------------------

1;

__END__
