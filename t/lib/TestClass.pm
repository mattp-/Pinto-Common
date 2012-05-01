package TestClass;

use Moose;
use Pinto::Types qw( File Dir Uri IO AuthorID Vers
                     Pkg Dist ArrayRefOfPkgsOrDists );

#-----------------------------------------------------------------------------

has file => (
    is   => 'rw',
    isa  => File,
    coerce => 1,
);

has dir => (
    is  => 'rw',
    isa => Dir,
    coerce => 1,
);

has uri => (
    is  => 'rw',
    isa => Uri,
    coerce => 1,
);

has io  => (
    is  => 'rw',
    isa => IO,
    coerce => 1,
);

has author => (
    is  => 'rw',
    isa => AuthorID,
    coerce => 1,
);

has version => (
    is  => 'rw',
    isa => Vers,
    coerce => 1,
);

has pkg => (
    is     => 'rw',
    isa    => Pkg,
    coerce => 1,
);

has dist => (
    is     => 'rw',
    isa    => Dist,
    coerce => 1,
);

has targets => (
    is     => 'rw',
    isa    => ArrayRefOfPkgsOrDists,
    coerce => 1,
);

#-----------------------------------------------------------------------------

1;
