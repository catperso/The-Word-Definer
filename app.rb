require 'sinatra'
require 'sinatra/reloader'
require './lib/word'
require './lib/definition'
also_reload 'lib/**/*.rb'

get('/') do
  redirect to('/words')
end

get('/words') do
  @words = Word.all
  erb(:words)
end

get('/words/new') do
  erb(:new_word)
end

post('/words') do
  new_word = params[:new_word]
  word = Word.new({word: new_word})
  word.save
  redirect to('/words')
end