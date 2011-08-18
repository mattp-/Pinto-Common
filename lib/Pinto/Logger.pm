package Pinto::Logger;

# ABSTRACT: A simple logger

use Moose;

use MooseX::Types::Moose qw(Int Bool);
use Pinto::Types qw(IO);

use Readonly;

use namespace::autoclean;

#-----------------------------------------------------------------------------

# VERSION

#-----------------------------------------------------------------------------
# Moose attributes

has log_level => (
    is         => 'ro',
    isa        => Int,
    lazy_build => 1,
);

has out => (
    is       => 'ro',
    isa      => IO,
    coerce   => 1,
    default  => sub { [fileno(STDOUT), '>'] },
);

has colorize => (
    is         => 'ro',
    isa        => Bool,
    lazy_build => 1,
);

#-----------------------------------------------------------------------------
# Moose roles

with qw(Pinto::Role::Configurable);

#-----------------------------------------------------------------------------

Readonly my $LOG_LEVEL_QUIET => -2;
Readonly my $LOG_LEVEL_WARN  => -1;
Readonly my $LOG_LEVEL_INFO  =>  0;
Readonly my $LOG_LEVEL_DEBUG =>  1;

#-----------------------------------------------------------------------------
# Builders

sub _build_log_level {
    my ($self) = @_;

    return $LOG_LEVEL_QUIET if $self->config->quiet();
    return $self->config->verbose();
}

#-----------------------------------------------------------------------------

sub _build_colorize {
    my ($self) = @_;

    return not $self->config->nocolor();
}

#-----------------------------------------------------------------------------
# Private functions

sub _logit {
    my ($self, $message) = @_;

    return print { $self->out() } "$message\n";
}

#-----------------------------------------------------------------------------
# Public methods

=method debug( $message )

Logs a message to C<STDOUT> if the C<log_level> is 1 or higher.

=cut

sub debug {
    my ($self, $message) = @_;

    $self->_logit($message) if $self->log_level() >= $LOG_LEVEL_DEBUG;

    return 1;
}

#-----------------------------------------------------------------------------

=method info( $message )

Logs a message to C<STDOUT> if the C<log_level> is 0 or higher.

=cut

sub info {
    my ($self, $message) = @_;

    $self->_logit($message) if $self->log_level() >= $LOG_LEVEL_INFO;

    return 1;
}

#-----------------------------------------------------------------------------

=method whine( $message )

Logs a message to C<STDERR> if the C<log_level> is -1 or higher.

=cut

sub whine {
    my ($self, $message) = @_;

    $message = _colorize($message, 'bold yellow') if $self->colorize();
    $self->_logit($message) if $self->log_level() >= $LOG_LEVEL_WARN;

    return 1;
}

#-----------------------------------------------------------------------------

=method fatal( $message )

Dies with the given message.

=cut

sub fatal {
    my ($self, $message) = @_;

    $message = _colorize($message, 'bold red') if $self->colorize();
    die "$message\n";  ## no critic (RequireCarping)
}

#-----------------------------------------------------------------------------

sub _colorize {
    my ($string, $color) = @_;

    return $string if not defined $color;
    return $string if $color eq q{};

    eval { require Term::ANSIColor }
      or return $string;

    # $terminator is a purely cosmetic change to make the color end at the end
    # of the line rather than right before the next line. It is here because
    # if you use background colors, some console windows display a little
    # fragment of colored background before the next uncolored (or
    # differently-colored) line.

    my $terminator = chomp $string ? "\n" : q{};
    return  Term::ANSIColor::colored( $string, $color ) . $terminator;
}

#-----------------------------------------------------------------------------

__PACKAGE__->meta->make_immutable();

#-----------------------------------------------------------------------------

1;

__END__
