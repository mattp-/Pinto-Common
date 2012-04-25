# ABSTRACT: Something that has a distribution archive attribute

package Pinto::Role::Attribute::archive;

use Moose::Role;

use Pinto::Types qw( File );

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

with qw( Pinto::Meta::Attribute::Trait::Postable );

#------------------------------------------------------------------------------
# Attributes

has archive  => (
    is       => 'ro',
    isa      => File,
    coerce   => 1,
    required => 1,
    traits   => [ qw(Postable) ],
    post_via => sub { [ $_[0]->archive->stringify ] },
);

#------------------------------------------------------------------------------

1;

__END__
