class Servatron::Static

  def initialize(app, servatron)
    @app, @servatron = app, servatron
  end

  def call env
    code, headers, body = Rack::File.new(@servatron.root.to_s).call(env)
    return [code, headers, body] if code < 400
    @app.call(env)
  end

end
