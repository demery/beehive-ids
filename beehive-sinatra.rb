# If you're using bundler, you will need to add this
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'bundler/setup'
require 'lib/beehive-ids'

require 'sinatra'

get '/' do
  params['tag']       = BeehiveIDs.new.tag
  params['last_copy'] = ''

  erb :index, locals: params
end

post '/' do
  params['last_copy'] = params['tag']
  puts "tag was #{params['tag']}"
  params['tag']       = BeehiveIDs.new.tag

  erb :index, locals: params
end