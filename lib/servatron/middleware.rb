require 'rack'
require 'rack/file'
require 'servatron/controller'

class Servatron::Middleware

  def initialize app, options={}
    @app, @options = app, options
    # options[:root] ||= Bundler.root
    # @controller = Servatron::Controller.new(options)
  end

  def call env
    controller = Servatron::Controller.new(env)
    controller.
    @controller.call(env)
  end

end

require 'pry-debugger'
