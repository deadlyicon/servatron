
class Servatron::Controllers

  def initialize app, servatron
    @app, @servatron = app, servatron
  end

  def call env
    Servatron::Controller.call(@servatron, env) || @app.call(env)
  end

end
