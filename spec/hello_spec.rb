# frozen_string_literal: true

require 'spec_helper'
require 'rack/test'

RSpec.describe 'hello app' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "GET / with zero elements added" do
    before do
      get '/'
    end

    it 'return empty on when there are no records' do
      json_response = JSON.parse(last_response.body)
      expect(json_response).to match_array([])
    end
  end
end
