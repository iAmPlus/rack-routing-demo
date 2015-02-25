class RouteHandler
  def initialize env, params, url_params
    @env = env
    @params = params
    @url_params = url_params
  end

  def get_root
    Rack::Response.new( 'Your request was GET /', 200 )
  end

  def get_foos
    Rack::Response.new( "Your request was GET /foos with @url_params #{ @url_params }", 200 )
  end

  def post_foos
    Rack::Response.new( "Your request was POST /foos with body params #{ @params }", 200 )
  end

  def not_found
    Rack::Response.new( '404: There is no route for your request.', 404 )
  end
end