require 'sinatra'
require 'json'
require 'securerandom'

require_relative '../database.rb'

before do
  content_type :json
end

require_relative '../app/hello.rb'
require_relative '../app/contact.rb'
