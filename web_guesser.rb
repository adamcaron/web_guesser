require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = Random.rand(3)
message       = nil
answer        = nil

def check_guess(guess)
  if guess.to_i > SECRET_NUMBER
    if (guess.to_i - SECRET_NUMBER) > 5
      message = "Way too high!"
    else
      message = "Too high!"
    end
  elsif guess.to_i < SECRET_NUMBER
    if (SECRET_NUMBER - guess.to_i) > 5
      message = "Way too low!"
    else
      message = "Too low!"
    end
  else
    message = "You got it right!" + "<p>The SECRET NUMBER is #{SECRET_NUMBER}</p>"
  end
end

get '/' do
  guess   = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end