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
  @definitions = Definition.all
  erb(:words)
end

get('/word/new') do
  erb(:new_word)
end

post('/words') do
  word = Word.new({word: params[:new_word]})
  word.save
  redirect to('/words')
end

delete('/words') do
  Definition.clear
  Word.clear
  redirect to('/words')
end

get('/word/:id') do
  @word = Word.find(params[:id].to_i)
  erb(:word)
end

delete('/word/:id') do
  word = Word.find(params[:id].to_i)
  word.definitions.each do |definition|
    definition.delete
  end
  word.delete
  redirect to('/words')
end

post('/word/:id/definitions') do
  @word = Word.find(params[:id].to_i)
  definition = Definition.new(definition: params[:new_definition], word_id: @word.id)
  definition.save
  erb(:word)
end

get('/word/:word_id/definition/:id') do
  @word = Word.find(params[:word_id].to_i)
  @definition = Definition.find(params[:id].to_i)
  erb(:definition)
end

delete('/word/:word_id/definition/:id') do
  definition = Definition.find(params[:id].to_i)
  definition.delete
  @word = Word.find(params[:word_id].to_i)
  erb(:word)
end