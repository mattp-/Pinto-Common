# ABSTRACT: Something that has a version attribute

package Pinto::Attribute::version;

use Moose::Role;

use Pinto::Types qw(Vers);

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

with qw( Pinto::Meta::Attribute::Trait::Postable );

#------------------------------------------------------------------------------

has version => (
    is        => 'ro',
    isa       => Vers,
    coerce    => 1,
    predicate => 'has_version',
    traits    => [ qw(Postable) ],
    post_via  => sub { $_[0]->version->stringify },
);

#------------------------------------------------------------------------------

1;

__END__
