package Pinto::Types;

# ABSTRACT: Moose types used within Pinto

use strict;
use warnings;

use MooseX::Types -declare => [ qw( Author Uri Dir File Files Io Vers StackName
                                    StackAt StackDefault PropertyName PkgSpec
                                    DistSpec Spec Specs) ];

use MooseX::Types::Moose qw( Str Num ScalarRef ArrayRef Undef
                             HashRef FileHandle Object Int );

use URI;
use Path::Class::Dir;
use Path::Class::File;
use IO::String;
use IO::Handle;
use IO::File;

use Pinto::SpecFactory;

use version;
use namespace::autoclean;

#-----------------------------------------------------------------------------

# VERSION

#-----------------------------------------------------------------------------

subtype Author,
  as Str,
  where   { m/^ [A-Z0-9-]+ $/x },
  message { "The author id ($_) must be alphanumeric" };

coerce Author,
  from Str,
  via  { uc $_ };

#-----------------------------------------------------------------------------

subtype StackName,
  as      Str,
  where   { m/^ [a-z0-9-_:]+ $/x },
  message { "The stack name ($_) must be alphanumeric" };

coerce StackName,
  from Str,
  via  { lc $_ };

#-----------------------------------------------------------------------------

subtype StackAt,
  as      Str,
  where   { $_ eq '@' },
  message { q{StackAt must be '@'} };

#-----------------------------------------------------------------------------

subtype StackDefault,
  as      Undef;

#-----------------------------------------------------------------------------

subtype PropertyName,
  as      Str,
  where   { length and not m/[^a-z0-9-_:]/x },
  message { "The property name ($_) must be alphanumeric" };

coerce PropertyName,
  from Str,
  via  { lc $_ };

#-----------------------------------------------------------------------------

class_type Vers, {class => 'version'};

coerce Vers,
  from Str,
  via { version->parse($_) };

coerce Vers,
  from Num,
  via { version->parse($_) };

#-----------------------------------------------------------------------------

class_type Uri, {class => 'URI'};

coerce Uri,
  from Str,
  via { URI->new($_) };

#-----------------------------------------------------------------------------

class_type Dir, {class => 'Path::Class::Dir'};

coerce Dir,
  from Str,             via { Path::Class::Dir->new($_) },
  from ArrayRef,        via { Path::Class::Dir->new(@{$_}) };

#-----------------------------------------------------------------------------

class_type File, {class => 'Path::Class::File'};

coerce File,
  from Str,             via { Path::Class::File->new($_) },
  from ArrayRef,        via { Path::Class::File->new(@{$_}) };

#-----------------------------------------------------------------------------

subtype Files, as ArrayRef[File];

coerce Files,
  from File,          via { [ $_ ] },
  from Str,           via { [ Path::Class::File->new($_) ] },
  from ArrayRef[Str], via { [ map { Path::Class::File->new($_) } @$_ ] };

#-----------------------------------------------------------------------------

class_type PkgSpec, {class => 'Pinto::PackageSpec'};

coerce PkgSpec,
  from Str,     via { Pinto::SpecFactory->make_spec($_) },
  from HashRef, via { Pinto::SpecFactory->make_spec($_) };

#-----------------------------------------------------------------------------

class_type DistSpec, {class => 'Pinto::DistributionSpec'};

coerce DistSpec,
  from Str,         via { Pinto::SpecFactory->make_spec($_) },
  from HashRef,     via { Pinto::SpecFactory->make_spec($_) };


#-----------------------------------------------------------------------------

subtype Specs,
  as ArrayRef[PkgSpec| DistSpec];    ## no critic qw(ProhibitBitwiseOperators);

coerce Specs,
  from  PkgSpec,            via { [ $_ ] },
  from  DistSpec,           via { [ $_ ] },
  from  Str,                via { [ Pinto::SpecFactory->make_spec($_) ] },
  from  ArrayRef[Str],      via { [ map { Pinto::SpecFactory->make_spec($_) } @$_ ] };

#-----------------------------------------------------------------------------

subtype Io, as Object;

coerce Io,
    from Str,        via { my $fh = IO::File->new(); $fh->open($_);   return $fh },
    from File,       via { my $fh = IO::File->new(); $fh->open("$_"); return $fh },
    from ArrayRef,   via { IO::Handle->new_from_fd( @$_ ) },
    from ScalarRef,  via { IO::String->new( ${$_} ) };

#-----------------------------------------------------------------------------

1;

__END__
