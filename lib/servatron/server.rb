require 'rack'

class Servatron::Server

  def self.start application, options={}
    new(application, options).start
  end

  def initialize application, options={}
    @application = application
    @port = options[:port] || 3000
    @rack = Rack::Builder.new do
      use Rack::CommonLogger, STDERR
      use Rack::ShowExceptions
      use Rack::Lint
      use Servatron::Controllers, application
      use Rack::Static, :root => application.root.to_s, :urls => ["/"]
      run -> env { [404, {}, [ %(#{env["PATH_INFO"]} not found) ] ] }
    end
  end

  def start
    puts "Starting #{@application.root.to_s.inspect} at http://localhost:#{@port}/"
    Rack::Server.new(app: @rack, :Port => @port).start
  end

end
