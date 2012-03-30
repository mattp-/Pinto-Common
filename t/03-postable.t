#!perl

use strict;
use warnings;

use Test::More;

#------------------------------------------------------------------------------

{
    package TEST;
    use Moose;

    with qw(Pinto::Meta::Attribute::Trait::Postable);

    has foo    => (
        is     => 'ro',
        traits => [ qw(Postable) ],
    );

    has bar     => (
        is      => 'ro',
        post_as => 'BAR',
        traits  => [ qw(Postable) ],
    );

    has baz      => (
        is       => 'ro',
        post_via => sub { $_[0]->baz * -1 },
        traits   => [ qw(Postable) ],
    );

    has nuts => (
        is     => 'ro',
        default => 'boo-hoo',
    );
}

#------------------------------------------------------------------------------

my $test = TEST->new(foo => 1, bar => 2, baz => 3, nuts => 4);
my %want = (foo => 1, BAR => 2, baz => -3);
my %have = @{ $test->as_post_data() };

is_deeply( \%have, \%want, 'Converted object to POST data' );

#------------------------------------------------------------------------------

done_testing();
