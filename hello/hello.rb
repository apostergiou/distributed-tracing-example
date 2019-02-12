# To run: ruby hello.rb
require 'sinatra'

require 'opentracing'
require 'jaeger/client'
require 'rack/tracer'

OpenTracing.global_tracer = Jaeger::Client.build(service_name: 'hello')

use Rack::Tracer

get '/' do
  'Hello'
end
