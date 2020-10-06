require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do 
        erb :super_hero
    end 

    post '/teams' do 
        #binding.pry 
        @team = Team.new(name: params[:team][:name], motto: params[:team][:motto])
        members = params[:team][:members]

        members.each do |members_params|
            SuperHero.new({name: members_params[:name], power: members_params[:power], bio: members_params[:bio]})
            end 
            @super_heroes = SuperHero.all

        erb :team

    end 
end
