
class Servatron::Controllers

  def initialize app, configuration
    @app, @configuration = app, configuration
  end

  def call env
    controller = Servatron::Controller.new(@configuration, env)
    if controller.exist?
      controller.response
    else
      @app.call(env)
    end


    # controller =
    # controller.
    # @controller.call(env)
  end

end
