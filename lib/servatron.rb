require "servatron/version"

module Servatron

  autoload :Path,          'servatron/path'
  autoload :Application,   'servatron/application'
  autoload :Configuration, 'servatron/configuration'
  autoload :CLI,           'servatron/cli'
  autoload :Middleware,    'servatron/middleware'
  autoload :Server,        'servatron/server'

  # middleware
  autoload :Static,        'servatron/static'
  autoload :Controllers,   'servatron/controllers'
  autoload :Controller,    'servatron/controller'

end
