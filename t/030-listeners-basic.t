#!perl6

use v6.c;

use Test;
use Audio::Icecast;

my $data-dir = $*PROGRAM.parent.child('data');

my $xml = $data-dir.child('admin_listeners.xml').slurp;

my $obj;

lives-ok { $obj = Audio::Icecast::Listeners.from-xml($xml); }, "create Listeners from xml";

is $obj.listeners.elems, 1, "we have one listener";

for $obj.listeners -> $listener {
    isa-ok $listener, 'Audio::Icecast::Listeners::Listener', "and the listener is the right thing";
    isa-ok $listener.connected, Duration, "and we got back a Duration for connected";
}

done-testing;
# vim: expandtab shiftwidth=4 ft=perl6
