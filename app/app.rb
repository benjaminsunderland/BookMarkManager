ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative './models/link.rb'
require_relative 'data_mapper_setup'

class BookMarkManager < Sinatra::Base
  get '/' do
    'You are on the homepage'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
    # You have to name the specified folders to allow it to find index.erb
  end

  get '/links/new' do
    erb(:'links/new')
  end

  post '/links' do
    link = Link.new(url:  params[:url],     # 1. Create a link
                  title:  params[:title])
    tag  = Tag.first_or_create(name: params[:tags])  # 2. Create a tag for the link
    link.tags << tag                       # 3. Adding the tag to the link's DataMapper collection.
    link.save                              # 4. Saving the link.
    redirect to('/links')
  end

  get '/tags/:name' do
  tag = Tag.first(name: params[:name])
  @links = tag ? tag.links : []
  erb :'links/index'
  end
  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
