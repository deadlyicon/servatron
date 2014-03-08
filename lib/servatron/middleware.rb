require 'rack'

module Servatron::Middleware

  def self.new servatron
    Rack::Builder.new do
      use Rack::CommonLogger, STDERR
      use Rack::ShowExceptions
      use Rack::Lint
      use Servatron::Controllers, servatron
    end
  end

end
