require "servatron/version"

module Servatron

  autoload :Path,          'servatron/path'
  autoload :Configuration, 'servatron/configuration'
  autoload :CLI,           'servatron/cli'
  autoload :Server,        'servatron/server'
  autoload :Controllers,   'servatron/controllers'
  autoload :Controller,    'servatron/controller'
  # autoload :Middleware,    'servatron/middleware'

  def self.start options={}
    Servatron::Server.new(options).start
  end

  def self.available_port
    server = TCPServer.new('127.0.0.1', 0)
    server.addr[1]
  ensure
    server.close if server
  end


end
