class Servatron::Controller

  def self.call servatron, env
    new(servatron, env).response
  end

  def initialize servatron, env
    @servatron = servatron
    @request = Rack::Request.new(env)
    return unless controller_path.file?
    @response = Rack::Response.new
    eval(controller_path.read)
  end
  attr_reader :servatron, :request, :response


  def controller_path
    @controller_path ||= begin
      path = request.path[1..-1]
      path = path.empty? ? "index.rb" : "#{path}.rb"
      servatron.root.join(path)
    end
  end

end

