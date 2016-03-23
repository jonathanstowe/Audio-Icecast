use v6;

use XML::Class;
use DateTime::Format;

class Audio::Icecast {
    class Source does XML::Class[xml-element => 'source'] {
        has Str $.mount;
        has Str $.audio-info is xml-element('audio_info');
        has Int $.bitrate is xml-element;
        has Int $.channels is xml-element;
        has Str $.genre is xml-element;
        has Int $.listener-peak is xml-element('listener_peak');
        has Int $.listeners is xml-element;
        has Str $.listen-url is xml-element('listenurl');
        sub ml-in(Str $v) returns Int {
            if $v eq 'unlimited' {
                int.Range.max;
            }
            else {
                Int($v);
            }
        }
        has Int  $.max-listeners is xml-deserialise(&ml-in) is xml-element('max_listeners');
        has Bool $.public is xml-element;
        has Int  $.samplerate is xml-element;
        has Str  $.server-description is xml-element('server_description');
        has Str  $.server-name is xml-element('server_name');
        has Str  $.server-type is xml-element('server_type');
        has Int  $.slow-listeners is xml-element('slow_listeners');
        has Str  $.source-ip is xml-element('source_ip');
        # TODO : find or fix something to parse the data format
        has Str  $.stream-start is xml-element('stream_start');
        has Int  $.total-bytes-read is xml-element('total_bytes_read');
        has Int  $.total-bytes-sent is xml-element('total_bytes_sent');
        has Str  $.user-agent is xml-element('user_agent');
    }
    class Stats does XML::Class[xml-element => 'icestats'] {
        has Str $.admin is xml-element;
        has Int $.clients is xml-element;
        has Int $.connections is xml-element;
        has Int $.file-connections is xml-element('file_connections');
        has Str $.host is xml-element;
        has Int $.listener-connections is xml-element('listener_connections');
        has Int $.listeners is xml-element;
        has Str $.location is xml-element;
        has Str $.server-id is xml-element('server_id');
        # TODO: find or fix something to parse this format
        has Str $.server-start is xml-element('server_start');
        has Int $.source-client-connections is xml-element('source_client_connections');
        has Int $.source-relay-connections is xml-element('source_relay_connections');
        has Int $.source-total-connections is xml-element('source_total_connections');
        has Int $.sources is xml-element;
        has Int $.stats is xml-element;
        has Int $.stats-connections is xml-element('stats_connections');
        has Source @.source;
    }
}
# vim: expandtab shiftwidth=4 ft=perl6
