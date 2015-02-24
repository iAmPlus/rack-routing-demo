class App
  class << self
    def call env
      begin
        Log.info "\nStarting request"
        process env
      rescue Exception => e
        handle_error e
      end
    end

    def process env
      Log.env_for env
      
      request = Request.new( env )
      request.response.finish
    end

    def handle_error e
      puts "Error processing request: #{ e.message }"
      puts e.backtrace[0..6]

      Response.error.finish
    end
  end
end