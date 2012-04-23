# ABSTRACT: Something that has a target attribute

package Pinto::Role::Attribute::target;

use Moose::Role;

use Pinto::PackageSpec;
use Pinto::DistributionSpec;

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------

with qw( Pinto::Meta::Attribute::Trait::Postable );

#------------------------------------------------------------------------------

has target => (
    is       => 'ro',
    isa      => 'Pinto::PackageSpec | Pinto::DistributionSpec',
    traits   => [ qw(Postable) ],
    post_via => sub { $_[0]->target->to_string },
    required => 1,
);

#------------------------------------------------------------------------------

around BUILDARGS => sub {
    my $orig = shift;
    my $class = shift;
    my %args = @_;

    # If the target is not a reference, then we presume it is a
    # specification string.  If the string contains a slash then it
    # must be a DistributionSpec.  Otherwise it must be a PackageSpec.

    if ($args{target} and not ref $args{target}) {
        my $target = delete $args{target};
        $args{target} = $target =~ m{/}x ? Pinto::DistributionSpec->new($target)
                                         : Pinto::PackageSpec->new($target);
    }

    return $class->$orig(%args);
};

#------------------------------------------------------------------------------

1;

__END__
