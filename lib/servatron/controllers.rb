
class Servatron::Controllers

  def initialize app, servatron
    @app, @servatron = app, servatron
  end

  def call env
    controller = Servatron::Controller.new(@servatron, env)
    if controller.exist?
      controller.response
    else
      @app.call(env)
    end


    # controller =
    # controller.
    # @controller.call(env)
  end

  def find_controllers!

  end

end
