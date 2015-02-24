class Request
  def initialize env
    @env = env
    @request = Rack::Request.new( env )
    @params  = params_for( env )

    Log.info "@params: #{ @params }"
  end


  def params_for env
    case env[ 'REQUEST_METHOD' ].to_sym
      when :GET
        Rack::Utils.parse_nested_query( env[ 'QUERY_STRING' ]).symbolize_keys
      when :POST, :PUT
        body = @request.body.read.to_s

        JSON.parse( body, symbolize_names:true )
    end
  end


  def response
    routing = Router.for( @env )
    @url_params = routing[ :params ]
    
    Log.info "routing to #{ routing[ :method ]}"
    Log.info "with @url_params:#{ @url_params }"
    
    send routing[ :method ]
  end


  def get_root
    Rack::Response.new( 'Your request was GET /', 200 )
  end

  def get_foo
    Rack::Response.new( 'Your request was GET /foo', 200 )
  end

  def not_found
    Rack::Response.new( '404: There is route for your request.', 404 )
  end
end