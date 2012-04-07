package TestClass;

use Moose;
use Pinto::Types qw(File Dir Uri IO AuthorID StackName Vers LogLevel);

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

has stack => (
    is  => 'rw',
    isa => StackName,
    coerce => 1,
);

has version => (
    is  => 'rw',
    isa => Vers,
    coerce => 1,
);

#-----------------------------------------------------------------------------

1;
