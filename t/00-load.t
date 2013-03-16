#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 3;

BEGIN {
    use_ok( 'Socket' ) || print "Bail out!\n";
    use_ok( 'Time::HiRes' ) || print "Bail out!\n";
    use_ok( 'Net::Ping' ) || print "Bail out!\n";
}

diag( "Testing Net::Ping $Net::Ping::VERSION, Perl $], $^X" );
