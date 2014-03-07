class Servatron::Controller

  def initialize options
    @root = options.fetch(:root)
  end

  def call env
    path_info = Rack::Utils.unescape(env["PATH_INFO"]).sub(/^\//,'')
    path = @root.join(path_info).to_s
    path = path + 'index' if path.end_with?('/') || File.directory?(path)
    extname = ::File.extname path
    mime = Rack::Mime.mime_type(extname, @default_mime)
    path = path[0..((extname.size + 1) * -1)]
    extension = extname[1..-1]

    handlers = Dir[path+'.*']
    templates = handlers.reject{|p| File.extname(p) == '.rb'}
    action = handlers - templates

    binding.pry

    [200, {}, [""]]
  end

end

# @default_mime = 'text/plain'



# @controller.call(env)

# Servatron::Action.new(
#   path: path,

# )

# binding.pry
