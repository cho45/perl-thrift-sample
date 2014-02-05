namespace perl MyApp.Thrift

typedef i64 timestamp

exception HogeException {
	1: string reason,
}

service FooService {
	timestamp getTime() throws (1:HogeException e),
}
