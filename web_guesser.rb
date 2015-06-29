require 'sinatra'
require 'sinatra/reloader'

random_number = Random.rand(100)

get '/' do
  "The secret number is #{random_number}"
end