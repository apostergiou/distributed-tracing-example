# distributed-tracing-example

An example of distributed tracing using jaeger, docker and Ruby.

## Usage

Fire up the engines:

```shell
$ make
```

Send a request to `hello_world` service:

```shell
$ curl curl http://localhost:4570
```

Check the trace using the jaeger web UI:

```
Visit http://localhost:16686/
```
