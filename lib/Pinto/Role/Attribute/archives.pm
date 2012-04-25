# ABSTRACT: Something that has a distribution archive attribute

package Pinto::Role::Attribute::archives;

use Moose::Role;
use Moose::Util::TypeConstraints;
use MooseX::Types::Moose qw(ArrayRef);

use Path::Class qw(file);
use Scalar::Util qw(blessed);
use List::MoreUtils qw(all);

use namespace::autoclean;

#------------------------------------------------------------------------------

# VERSION

#------------------------------------------------------------------------------
# TODO: Come up with a custom Type and coercion to do the right thing with...
# ArrayRef of objects, ArrayRef of strings, single object, single string

subtype 'Archives',
    as  'ArrayRef',
    where { all { blessed $_ and $_->isa('Path::Class::File') } @$_ },
              message { 'Not an array of Path::Class::File objects' };

coerce   'Archives',
    from 'ArrayRef',
    via  { [ map {file("$_")} @$_ ] };

coerce   'Archives',
    from 'Str',
    via  { [ file("$_") ] };

class_type 'Path::Class::File';

coerce   'Archives',
    from 'Path::Class::File',
    via  { [ $_ ] };

#------------------------------------------------------------------------------

has archives  => (
    isa      => 'Archives',
    coerce   => 1,
    required => 1,
    traits   => [ qw(Array) ],
    handles  => {archives => 'elements'}
);

#------------------------------------------------------------------------------

1;

__END__
