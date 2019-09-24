# frozen_string_literal: true

# def json_params
#   begin
    
#   rescue
#     halt 400, {message: 'Invalid JSON'}.to_json
#   end
# end
    
get '/' do
  Database.all.to_json
end

get '/:id' do
  Database.find(params[:id]).to_json
end

put '/replace/:id' do
  json_params = JSON.parse(request.body.read)
  Database.replace(json_params, params[:id]).to_json
end

patch '/update/:id' do
  json_params = JSON.parse(request.body.read)
  Database.update(json_params, params[:id]).to_json
end

post '/save' do
  json_params = JSON.parse(request.body.read)
  contact = Contact.new(json_params)
  Database.store(contact).to_json
end

delete '/delete/:id' do
  Database.delete(params[:id]).to_json
end
