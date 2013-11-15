require 'servatron/middleware'

app = Rack::Builder.app do
  use Servatron::Middleware
  run ->{ [404, {}, []] }
end

run app
