# require 'servatron/middleware'

# use Rack::CommonLogger, STDERR
# use Rack::ShowExceptions
# use Rack::Lint
# use Servatron::Middleware
# run -> env { [404, {}, [ %(#{env["PATH_INFO"]} not found) ] ] }
