class Servatron::Controller

  def initialize application, env
    @application = application
    @request = Rack::Request.new(env)
  end
  attr_reader :application, :request

  def possible_controller_paths
    path = request.path[1..-1]
    [
      application.root.join("#{path}/index.rb"),
      application.root.join("#{path}.rb"),
    ]
  end

  def controller_path
    @controller_path ||= possible_controller_paths.find(&:exist?)
  end

  def exist?
    @exist ||= !controller_path.nil?
  end

  def response
    controller_path


    [200, {}, ["Controller found for #{request.path.inspect}"]]
  end


  # def call env
  #   path_info = Rack::Utils.unescape(env["PATH_INFO"]).sub(/^\//,'')
  #   path = @root.join(path_info).to_s
  #   path = path + 'index' if path.end_with?('/') || File.directory?(path)
  #   extname = ::File.extname path
  #   mime = Rack::Mime.mime_type(extname, @default_mime)
  #   path = path[0..((extname.size + 1) * -1)]
  #   extension = extname[1..-1]

  #   handlers = Dir[path+'.*']
  #   templates = handlers.reject{|p| File.extname(p) == '.rb'}
  #   action = handlers - templates

  #   binding.pry

  #   [200, {}, [""]]
  # end

end

# @default_mime = 'text/plain'



# @controller.call(env)

# Servatron::Action.new(
#   path: path,

# )

# binding.pry
