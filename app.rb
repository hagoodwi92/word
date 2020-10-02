require('sinatra')
require('sinatra/reloader')
require('./lib/word')
#require('./lib/song')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all
  erb(:word)
end

