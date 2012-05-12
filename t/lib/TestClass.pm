package TestClass;

use Moose;
use Pinto::Types qw( File Dir Uri Io Author Vers PropertyName
                     MaybeStackName StackName PkgSpec DistSpec Specs );

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
    isa => Io,
    coerce => 1,
);

has author => (
    is  => 'rw',
    isa => Author,
    coerce => 1,
);

has stack => (
    is  => 'rw',
    isa => StackName,
    coerce => 1,
);


has maybe_stack => (
    is  => 'rw',
    isa => MaybeStackName,
    coerce => 1,
);


has property => (
    is  => 'rw',
    isa => PropertyName,
    coerce => 1,
);

has version => (
    is  => 'rw',
    isa => Vers,
    coerce => 1,
);

has pkg => (
    is     => 'rw',
    isa    => PkgSpec,
    coerce => 1,
);

has dist => (
    is     => 'rw',
    isa    => DistSpec,
    coerce => 1,
);

has targets => (
    is     => 'rw',
    isa    => Specs,
    coerce => 1,
);

#-----------------------------------------------------------------------------

1;
