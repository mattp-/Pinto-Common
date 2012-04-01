# ABSTRACT: Something that has an output handle attribute

package Pinto::Attribute::out;

use Moose::Role;

use Pinto::Types qw(IO);

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------
# Attributes

has out => (
    is      => 'ro',
    isa     => IO,
    coerce  => 1,
    default => sub { [fileno(STDOUT), '>'] },
);

#------------------------------------------------------------------------------

1;

__END__
