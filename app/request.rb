class Request
  def initialize env
    @env = env
    @request = Rack::Request.new( env )
    @params  = params_for( env )
  end


  def params_for env
    case env[ 'REQUEST_METHOD' ].to_sym
      when :GET
        Rack::Utils.parse_nested_query( env[ 'QUERY_STRING' ])
      when :POST, :PUT
        body = @request.body.read.to_s

        JSON.parse( body )
    end
  end


  def response
    routing = Router.for( @env )
    @url_params = routing[ :params ]
    
    send routing[ :method ]
  end


  def get_root
    Rack::Response.new( 'Your request was GET /', 200 )
  end

  def post_foos
    Rack::Response.new( "Your request was POST /foos with body params #{ @params }", 200 )
  end

  def not_found
    Rack::Response.new( '404: There is no route for your request.', 404 )
  end
end