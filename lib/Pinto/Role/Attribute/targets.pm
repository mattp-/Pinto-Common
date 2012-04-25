# ABSTRACT: Something that has a target attribute

package Pinto::Role::Attribute::targets;

use Moose::Role;
use Moose::Util::TypeConstraints;

use Pinto::PackageSpec;
use Pinto::DistributionSpec;

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------
# TODO: Come up with a custom Type and coercion to do the right thing with...
# ArrayRef of objects, ArrayRef of strings, single object, single string

has targets => (
    isa      => 'ArrayRef',
    traits   => [ qw(Array) ],
    handles  => {targets => 'elements'},
    required => 1,
);

#------------------------------------------------------------------------------

around BUILDARGS => sub {
    my ($orig, $class, %args) = @_;

    # Convert a scalar to a one element array
    my $targets = delete $args{targets};
    $targets = [ $targets || () ] if ref $targets ne 'ARRAY';

    my @objects;
    for my $target ( @{ $targets } ){

        # If the target is not a reference, then we presume it is a
        # specification string.  If the string contains a slash then
        # it must be a DistributionSpec.  Otherwise it must be a
        # PackageSpec.

        push @objects, ref $target ? $target :
                ($target =~ m{/}x) ? Pinto::DistributionSpec->new($target)
                                   : Pinto::PackageSpec->new($target);
    }

    $args{targets} = \@objects;
    return $class->$orig(%args);
};

#------------------------------------------------------------------------------

1;

__END__
