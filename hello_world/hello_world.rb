# To run: ruby hello_world.rb -p 4570
require 'sinatra'

require 'opentracing'
require 'jaeger/client'
require 'rack/tracer'

OpenTracing.global_tracer = Jaeger::Client.build(service_name: 'hello-world')

use Rack::Tracer

get '/' do
  "#{hello} world"
end

def hello
  client = Net::HTTP.new('localhost', 4567)
  req = Net::HTTP::Get.new('/')
  OpenTracing.inject(env['rack.span'].context, OpenTracing::FORMAT_RACK, req)
  client.request(req).body
end
