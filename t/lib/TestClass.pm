package TestClass;

use Moose;
use Pinto::Types qw(File Dir URI IO AuthorID);

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
    isa => URI,
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

#-----------------------------------------------------------------------------

1;
