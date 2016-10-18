require 'sinatra/base'
require './models/link'

ENV['RACK_ENV'] ||= 'development'

class BookmarkManager < Sinatra::Base
  set :enviroment, :development

  get '/' do
    redirect '/links'
  end

  get '/links' do
    erb :links
  end

  get '/links/new' do
    erb :new_link
  end

  post '/links' do
  	Link.create(title: params[:title], url: params[:url])
  	redirect '/'
  end

  run! if app_file == $0

end
