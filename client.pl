#!/usr/bin/env perl

use utf8;
use strict;
use warnings;
use lib lib => glob 'modules/*/lib';


use Thrift;
use Thrift::Socket;
use Thrift::BufferedTransport;
use Thrift::XS::BinaryProtocol;

use MyApp::Thrift::Types;
use MyApp::Thrift::Constants;
use MyApp::Thrift::FooService;

my ($host, $port) = ('localhost', 65432);

my $socket    = Thrift::Socket->new( $host, $port );
my $transport = Thrift::BufferedTransport->new($socket);
my $protocol  = Thrift::XS::BinaryProtocol->new($transport);
my $client    = MyApp::Thrift::FooServiceClient->new($protocol);
$transport->open;

use Data::Dumper;
warn Dumper $client->getTime();



