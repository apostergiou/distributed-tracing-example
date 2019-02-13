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
  uri = URI("http://#{ENV['HELLO_APP'] || 'localhost'}:4567")
  Net::HTTP.start(uri.host, uri.port) do |http|
    req = Net::HTTP::Get.new uri
    OpenTracing.inject(env['rack.span'].context, OpenTracing::FORMAT_RACK, req)
    resp = http.request req
    resp.body
  end
end
