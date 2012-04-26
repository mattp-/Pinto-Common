# ABSTRACT: Something that has a distribution archives attribute

package Pinto::Role::Attribute::archives;

use Moose::Role;

use Pinto::Types qw(ArrayRefOfFiles);

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

has archives  => (
    isa       => ArrayRefOfFiles,
    traits    => [ qw(Array) ],
    handles   => {archives => 'elements'},
    required  => 1,
    coerce    => 1,
);

#------------------------------------------------------------------------------

1;

__END__
