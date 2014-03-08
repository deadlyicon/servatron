require 'rack'

class Servatron::Server

  def initialize servatron
    @servatron = servatron
    @app = Rack::Builder.new do
      use Rack::CommonLogger, STDERR
      use Rack::ShowExceptions
      use Rack::Lint
      use Servatron::Controllers, servatron
      run -> env { [404, {}, [ %(#{env["PATH_INFO"]} not found) ] ] }
    end
  end

  def start
    Rack::Server.new(app: @app, :Port => @servatron.port).start
  end

end


# ENV['RACK_ENV'] ||= 'development'
# config = File.expand_path('../../config.ru', __FILE__)

# port = options[:port] || 3000

# # options = {:Port => 9393, :Host => '127.0.0.1', :AccessLog => [], :Path => '/'}

# if ENV['RACK_ENV'] == 'development'
#   require 'shotgun'
#   app = Shotgun::Loader.new(config)
#   Rack::Server.new(app: app, :Port => port).start
# else
#   require 'rack'
#   Rack::Server.new(config: config, :Port => port).start
# end
