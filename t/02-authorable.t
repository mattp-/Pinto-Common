#!perl

use strict;
use warnings;

use Test::More;

#------------------------------------------------------------------------------

{
    package TEST;
    use Moose;
    with qw(Pinto::Role::Attribute::author);
}

#------------------------------------------------------------------------------

{
    my $username = 'testuser';
    local $ENV{USER} = $username;

    my $test_obj = TEST->new(pauserc => 'nowhere');
    is $test_obj->author(), uc $username, 'Got author ID from username'
}

#------------------------------------------------------------------------------

{
   my $pauseid = 'pauseid';
   my $pauserc = File::Temp->new();
   print {$pauserc} "user $pauseid\n";
   close $pauserc;

    my $test_obj = TEST->new(pauserc => $pauserc->filename);
    is $test_obj->author(), uc $pauseid, 'Got author ID from .pause file'
}

#------------------------------------------------------------------------------

done_testing();
