use warnings;
use strict;

use Test::More tests => 3;
BEGIN {use_ok('Net::Ping')};

SKIP: {
    eval {
       require Net::Ping::External;
    };
    skip "No Net::Ping::External", 2 if $@;
    my $p = Net::Ping->new('external');
    isa_ok($p, "Net::Ping");
    my $result = $p->ping("www.google.com");
    is($result, 1, 'tested $p->ping using external');
}
