#
# Autogenerated by Thrift Compiler (0.9.1)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#
require 5.6.0;
use strict;
use warnings;
use Thrift;

use MyApp::Thrift::Types;

# HELPER FUNCTIONS AND STRUCTURES

package MyApp::Thrift::FooService_getTime_args;
use base qw(Class::Accessor);

sub new {
  my $classname = shift;
  my $self      = {};
  my $vals      = shift || {};
  return bless ($self, $classname);
}

sub getName {
  return 'FooService_getTime_args';
}

sub read {
  my ($self, $input) = @_;
  my $xfer  = 0;
  my $fname;
  my $ftype = 0;
  my $fid   = 0;
  $xfer += $input->readStructBegin(\$fname);
  while (1) 
  {
    $xfer += $input->readFieldBegin(\$fname, \$ftype, \$fid);
    if ($ftype == TType::STOP) {
      last;
    }
    SWITCH: for($fid)
    {
        $xfer += $input->skip($ftype);
    }
    $xfer += $input->readFieldEnd();
  }
  $xfer += $input->readStructEnd();
  return $xfer;
}

sub write {
  my ($self, $output) = @_;
  my $xfer   = 0;
  $xfer += $output->writeStructBegin('FooService_getTime_args');
  $xfer += $output->writeFieldStop();
  $xfer += $output->writeStructEnd();
  return $xfer;
}

package MyApp::Thrift::FooService_getTime_result;
use base qw(Class::Accessor);
MyApp::Thrift::FooService_getTime_result->mk_accessors( qw( success ) );

sub new {
  my $classname = shift;
  my $self      = {};
  my $vals      = shift || {};
  $self->{success} = undef;
  $self->{e} = undef;
  if (UNIVERSAL::isa($vals,'HASH')) {
    if (defined $vals->{success}) {
      $self->{success} = $vals->{success};
    }
    if (defined $vals->{e}) {
      $self->{e} = $vals->{e};
    }
  }
  return bless ($self, $classname);
}

sub getName {
  return 'FooService_getTime_result';
}

sub read {
  my ($self, $input) = @_;
  my $xfer  = 0;
  my $fname;
  my $ftype = 0;
  my $fid   = 0;
  $xfer += $input->readStructBegin(\$fname);
  while (1) 
  {
    $xfer += $input->readFieldBegin(\$fname, \$ftype, \$fid);
    if ($ftype == TType::STOP) {
      last;
    }
    SWITCH: for($fid)
    {
      /^0$/ && do{      if ($ftype == TType::I64) {
        $xfer += $input->readI64(\$self->{success});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^1$/ && do{      if ($ftype == TType::STRUCT) {
        $self->{e} = new MyApp::Thrift::HogeException();
        $xfer += $self->{e}->read($input);
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
        $xfer += $input->skip($ftype);
    }
    $xfer += $input->readFieldEnd();
  }
  $xfer += $input->readStructEnd();
  return $xfer;
}

sub write {
  my ($self, $output) = @_;
  my $xfer   = 0;
  $xfer += $output->writeStructBegin('FooService_getTime_result');
  if (defined $self->{success}) {
    $xfer += $output->writeFieldBegin('success', TType::I64, 0);
    $xfer += $output->writeI64($self->{success});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{e}) {
    $xfer += $output->writeFieldBegin('e', TType::STRUCT, 1);
    $xfer += $self->{e}->write($output);
    $xfer += $output->writeFieldEnd();
  }
  $xfer += $output->writeFieldStop();
  $xfer += $output->writeStructEnd();
  return $xfer;
}

package MyApp::Thrift::FooServiceIf;

use strict;


sub getTime{
  my $self = shift;

  die 'implement interface';
}

package MyApp::Thrift::FooServiceRest;

use strict;


sub new {
  my ($classname, $impl) = @_;
  my $self     ={ impl => $impl };

  return bless($self,$classname);
}

sub getTime{
  my ($self, $request) = @_;

  return $self->{impl}->getTime();
}

package MyApp::Thrift::FooServiceClient;


use base qw(MyApp::Thrift::FooServiceIf);
sub new {
  my ($classname, $input, $output) = @_;
  my $self      = {};
  $self->{input}  = $input;
  $self->{output} = defined $output ? $output : $input;
  $self->{seqid}  = 0;
  return bless($self,$classname);
}

sub getTime{
  my $self = shift;

    $self->send_getTime();
  return $self->recv_getTime();
}

sub send_getTime{
  my $self = shift;

  $self->{output}->writeMessageBegin('getTime', TMessageType::CALL, $self->{seqid});
  my $args = new MyApp::Thrift::FooService_getTime_args();
  $args->write($self->{output});
  $self->{output}->writeMessageEnd();
  $self->{output}->getTransport()->flush();
}

sub recv_getTime{
  my $self = shift;

  my $rseqid = 0;
  my $fname;
  my $mtype = 0;

  $self->{input}->readMessageBegin(\$fname, \$mtype, \$rseqid);
  if ($mtype == TMessageType::EXCEPTION) {
    my $x = new TApplicationException();
    $x->read($self->{input});
    $self->{input}->readMessageEnd();
    die $x;
  }
  my $result = new MyApp::Thrift::FooService_getTime_result();
  $result->read($self->{input});
  $self->{input}->readMessageEnd();

  if (defined $result->{success} ) {
    return $result->{success};
  }
  if (defined $result->{e}) {
    die $result->{e};
  }
  die "getTime failed: unknown result";
}
package MyApp::Thrift::FooServiceProcessor;

use strict;


sub new {
    my ($classname, $handler) = @_;
    my $self      = {};
    $self->{handler} = $handler;
    return bless ($self, $classname);
}

sub process {
    my ($self, $input, $output) = @_;
    my $rseqid = 0;
    my $fname  = undef;
    my $mtype  = 0;

    $input->readMessageBegin(\$fname, \$mtype, \$rseqid);
    my $methodname = 'process_'.$fname;
    if (!$self->can($methodname)) {
      $input->skip(TType::STRUCT);
      $input->readMessageEnd();
      my $x = new TApplicationException('Function '.$fname.' not implemented.', TApplicationException::UNKNOWN_METHOD);
      $output->writeMessageBegin($fname, TMessageType::EXCEPTION, $rseqid);
      $x->write($output);
      $output->writeMessageEnd();
      $output->getTransport()->flush();
      return;
    }
    $self->$methodname($rseqid, $input, $output);
    return 1;
}

sub process_getTime {
    my ($self, $seqid, $input, $output) = @_;
    my $args = new MyApp::Thrift::FooService_getTime_args();
    $args->read($input);
    $input->readMessageEnd();
    my $result = new MyApp::Thrift::FooService_getTime_result();
    eval {
      $result->{success} = $self->{handler}->getTime();
    }; if( UNIVERSAL::isa($@,'MyApp::Thrift::HogeException') ){ 
      $result->{e} = $@;
    }
    $output->writeMessageBegin('getTime', TMessageType::REPLY, $seqid);
    $result->write($output);
    $output->writeMessageEnd();
    $output->getTransport()->flush();
}

1;