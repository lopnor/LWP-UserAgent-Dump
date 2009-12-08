package LWP::UserAgent::Dump;

use strict;
use warnings;
use LWP::UserAgent;
use Data::Dumper;
our $VERSION = '0.01';

my $orig = \&LWP::UserAgent::request;

sub _request {
    my ($self, $req, @args) = @_;
    my $res = $orig->($self, $req, @args);
    warn $req->as_string;
    warn $res->as_string;
    warn Dumper $res;
    return $res;
}

{
    no strict 'refs';
    no warnings 'redefine';
    *LWP::UserAgent::request = \&_request;
}

1;
__END__

=head1 NAME

LWP::UserAgent::Dump - Dumps LWP::UserAgent requests and responses

=head1 SYNOPSIS

  % perl -I/path/to/LWP-UserAgent-Dump/lib -MLWP::UserAgent::Dump yourscript.pl

=head1 DESCRIPTION

LWP::UserAgent::Dump Dumps LWP::UserAgent requests and responses.

=head1 AUTHOR

Nobuo Danjou E<lt>nobuo.danjou@gmail.comE<gt>

=head1 SEE ALSO

L<LWP::UserAgent>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
