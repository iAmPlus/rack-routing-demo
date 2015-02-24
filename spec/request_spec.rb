require 'spec_helper'

describe 'Get root' do
  specify do
    get '/'

    expect( last_response.status ).to eq  200
    expect( last_response.body   ).to eq 'Your request was GET /'
  end
end