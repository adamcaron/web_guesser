require 'sinatra'
require 'sinatra/reloader'

number = Random.rand(100)

get '/' do
  erb :index, :locals => {:number => number}
end