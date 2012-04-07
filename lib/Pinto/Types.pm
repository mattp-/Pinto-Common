package Pinto::Types;

# ABSTRACT: Moose types used within Pinto

use strict;
use warnings;

use MooseX::Types -declare => [ qw( AuthorID StackName Uri Dir File IO Vers LogLevel) ];
use MooseX::Types::Moose qw( Str Num ScalarRef ArrayRef FileHandle Object Int);

use URI;
use Path::Class::Dir;
use Path::Class::File;
use File::HomeDir;
use IO::String;
use IO::Handle;
use IO::File;

use version;
use namespace::autoclean;

#-----------------------------------------------------------------------------

# VERSION

#-----------------------------------------------------------------------------

subtype AuthorID,
    as Str,
    where { not m/[^A-Z0-9-]/x },
    message { "The author id ($_) must be alphanumeric" };

coerce AuthorID,
    from Str,
    via  { uc $_ };

#-----------------------------------------------------------------------------

subtype LogLevel,
    as Str,
    where { m/^(debug|info|notice|warning|error)$/x },
    message { "Log level ($_) must be one of: debug info notice warning error" };

#-----------------------------------------------------------------------------

subtype StackName,
    as Str,
    where { not m/[^a-z0-9-_]/x },
    message { "The stack name ($_) must be alphanumeric" };

coerce StackName,
    from Str,
    via { lc $_ };

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

subtype Dir, as 'Path::Class::Dir';

coerce Dir,
    from Str,             via { Path::Class::Dir->new( _expand_tilde($_) ) },
    from ArrayRef,        via { Path::Class::Dir->new( _expand_tilde( @{$_} ) ) };

#-----------------------------------------------------------------------------

subtype File, as 'Path::Class::File';

coerce File,
    from Str,             via { Path::Class::File->new( _expand_tilde($_) ) },
    from ArrayRef,        via { Path::Class::File->new( @{$_} ) };

sub _expand_tilde {
    my (@paths) = @_;

    $paths[0] =~ s|\A ~ (?= \W )|File::HomeDir->my_home()|xe;

    return @paths;
}

#-----------------------------------------------------------------------------

subtype IO, as Object;

coerce IO,
    from Str,        via { my $fh = IO::File->new(); $fh->open($_);   return $fh },
    from File,       via { my $fh = IO::File->new(); $fh->open("$_"); return $fh },
    from ArrayRef,   via { IO::Handle->new_from_fd( @$_ ) },
    from ScalarRef,  via { IO::String->new( ${$_} ) };

#-----------------------------------------------------------------------------

1;

__END__
