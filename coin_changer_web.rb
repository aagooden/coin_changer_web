require_relative "coin_changer_methods.rb"
require 'rubygems'
require "sinatra"

enable :sessions
	
get "/" do
	erb :welcome
end

get "/input" do
	if params[:name].nil?
	else
	session[:name] = params[:name]
	end 
	erb :input
end

post "/input" do

	cents = params[:cents]
	cents = cents.to_i

	change = changer(cents)
	change = change_singular(change)
	session[:coins] = change

	redirect "/show"

end

get "/show" do
	erb :show
end