require "servatron/version"

# Servatron.new({}).middleware
# Servatron.new({}).start
class Servatron

  autoload :Path,          'servatron/path'
  autoload :Configuration, 'servatron/configuration'
  autoload :CLI,           'servatron/cli'
  autoload :Middleware,    'servatron/middleware'
  autoload :Server,        'servatron/server'
  autoload :Controllers,   'servatron/controllers'
  autoload :Controller,    'servatron/controller'

  def initialize options={}
    @options = options.dup.freeze
  end
  attr_reader :options

  def middleware
    @middleware ||= Servatron::Middleware.new(self)
  end

  def start
    Servatron::Server.new(self).start
  end

  def port
    @port ||= options[:port] || 3000
  end

  def app_root
    @app_root ||= Servatron::Path.new(options[:app_root] || Bundler.root)
  end

end
