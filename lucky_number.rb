require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

#Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

#set homepage
get("/") do
  erb(:elephant)
end

#roll two six-sided dice
get("/dice/2/6") do
  @roll = []
  2.times do
    die = rand(1..6)
    @roll.push(die)
  end

  erb(:two_six)
end

get("/dice/2/10") do
  #create an empty roll array
  @roll = []
  2.times do
    die = rand(1..10)
    @roll.push(die)
  end

  erb(:two_ten)
end

get("/dice/1/20") do
  @roll = rand(1..20)  
  
  erb(:one_twenty)
  
end

get("/dice/5/4") do
  @roll = []
  5.times do
    die = rand(1..4)
    @roll.push(die)
  end
  erb(:five_four)
end


get("/dice/100/6") do
  #create an empty array with rolls
  @roll = []
  
  #roll a 6-sided die 100 times
  100.times do
    die = rand(1..6)

    @roll.push(die)

  end
  #change the view

  erb(:one_hundred_six)
end 
