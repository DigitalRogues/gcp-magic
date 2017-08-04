require 'sinatra'
require 'ap'
require 'mongo'
require 'json'
require 'em/pure_ruby'

set :bind, '0.0.0.0'

def getRecord()
serv = "#{ENV['MONGO_SERVICE_PORT_27017_TCP_ADDR']}:#{ENV['MONGO_SERVICE_PORT_27017_TCP_PORT']}" 
client = Mongo::Client.new([ serv ], :database => 'magicAPI')
client[:magicObj].find().sort(:lastUpdated_unix => -1).limit(1).each do |document|
    #=> Yields a BSON::Document.
    pretty  = JSON.pretty_generate(document)
	client.close
    return pretty
    end
end


get '/' do
    "<html><pre>#{getRecord()}</pre></html>"
end

get '/json' do
    "#{getRecord()}"
end
