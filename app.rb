require 'sinatra/base'
ENV['RACK_ENV'] ||= 'development'
require './models/data_mapper_setup.rb'


class BookmarkManager < Sinatra::Base

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
    link = Link.create(title: params[:title], url: params[:url])
    tag = Tag.create(tag_name: params[:tags])
    link.tags << tag
    link.save

  	redirect '/'
  end

  run! if app_file == $0

end
