require 'rack'

class Servatron::Middleware

  def initialize app, options={}
    @app, @options = app, options
  end

  def call env

    body = Bundler.root.to_s

    body << "\n\n ehddddd?"

    [200, {}, [body]]
  end

end
