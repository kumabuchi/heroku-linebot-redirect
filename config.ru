require 'bundler/setup'
require 'sinatra/base'
require 'json'
require 'rest-client'

class App < Sinatra::Base
  get '/' do
    "OK"
  end

  post '/' do
    endpoint_uri = 'http://localhost:4568/'
    content_json = request.body.read

    RestClient.post(endpoint_uri, content_json, {
      'Content-Type' => 'application/json; charset=UTF-8',
    })
    "OK"
  end
end

run App
