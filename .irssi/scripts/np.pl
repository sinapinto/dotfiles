use strict;
use Irssi;

use vars qw($VERSION %IRSSI);

$VERSION = 20150730;
%IRSSI = (
    authors     => "sina pinto",
    contact     => "sina dot pinto at gmail dot com",
    name        => "np.pl",
    description => "prints currently playing song from mpc with a youtube link",
);

sub get_url {
    use LWP::UserAgent;
    use URI::Escape;
    my $agent = LWP::UserAgent->new;
    $agent->agent("Mozilla/5.0");
    my $query = uri_escape $_[0];
    my $req = HTTP::Request->new(GET => 'http://youtube.com/results?search_query='.$query);
    my $res = $agent->request($req);
    $res->content =~ /.*<a href="(\/watch[^"]*)"/;
    return 'http://youtube.com'.$1;
}

sub np_cmd {
    # data - parameters for command
    # witem - the active window item (eg. channel, query)
    my ($data, $server, $witem) = @_;
    if (!$server || !$server->{connected}) {
        Irssi::print("Not connected to server");
        return;
    }

    my $song = `/usr/bin/mpc current`;

    my $url = get_url($song);
    if ($witem && ($witem->{type} eq "CHANNEL" || $witem->{type} eq "QUERY")) {
        $witem->command("MSG ".$witem->{name}." listening to: ".$song." [".$url."]");
    } else {
        Irssi::print("No active channel/query in window");
    }
}

Irssi::command_bind('np', 'np_cmd');
