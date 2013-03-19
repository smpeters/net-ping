use warnings;
use strict;

use Test::More qw(no_plan);
BEGIN {use_ok('Net::Ping')};

# plain ol' constuctor call
my $p = Net::Ping->new();
isa_ok($p, "Net::Ping");

# call new from an instantiated object
my $p2 = $p->new();
isa_ok($p2, "Net::Ping");

# check for invalid proto
eval {
    $p = Net::Ping->new("thwackkk");
};
like($@, qr/Protocol for ping must be "icmp", "udp", "tcp", "syn", "stream", or "external"/, "new() errors for invalid protocol");

# check for invalid timeout
eval {
    $p = Net::Ping->new("tcp", -1);
};
like($@, qr/Default timeout for ping must be greater than 0 seconds/, "new() errors for invalid timeout");

# check for invalid data sizes
eval {
    $p = Net::Ping->new("udp", 10, -1);
};
like($@, qr/Data for ping must be from/, "new() errors for invalid data size");
diag $p->{"data_size"};

eval {
    $p = Net::Ping->new("udp", 10, 1025);
};
like($@, qr/Data for ping must be from/, "new() errors for invalid data size");
diag $p->{"data_size"};
