use utf8;
use strict;
use warnings;
use lib lib => glob 'modules/*/lib';

use Thrift;
use Thrift::Server;
use Thrift::Socket;
use Thrift::BufferedTransport;
use Thrift::XS::BinaryProtocol;

use MyApp::Thrift::Types;
use MyApp::Thrift::Constants;
use MyApp::Thrift::FooService;

my ($host, $port) = ('localhost', 65432);

my $transport = Thrift::ServerSocket->new($port);
my $processor = MyApp::Thrift::FooServiceProcessor->new(MockServer->new);
my $server    = Thrift::SimpleServer->new($processor, $transport);
$server->serve;

package MockServer {
	sub new {
		my ($class, %opts) = @_;
		bless {}, $class;
	}

	sub getTime {
		my ($self) = @_;
		# die MyApp::Thrift::HogeException->new({ reason => 'Not Implemented' });
		scalar time;
	}
}
