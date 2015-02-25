require 'spec_helper'

describe 'Requests' do
  specify 'GET /' do
    get '/'

    expect( last_response.status ).to eq  200
    expect( last_response.body   ).to eq 'Your request was GET /'
  end

  specify 'GET /foos/123' do
    get '/foos/123'

    expect( last_response.status ).to eq  200
    expect( last_response.body   ).to eq 'Your request was GET /foos with @url_params {:id=>"123"}'
  end

  specify 'POST /foos' do
    post '/foos', { bar:'baz' }.to_json

    expect( last_response.status ).to eq  200
    expect( last_response.body   ).to eq 'Your request was POST /foos with body params {"bar"=>"baz"}'
  end

  specify 'GET /no_such_url' do
    get '/no_such_url'

    expect( last_response.status ).to eq  404
    expect( last_response.body   ).to eq '404: There is no route for your request.'
  end
end