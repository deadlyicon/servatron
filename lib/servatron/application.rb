class Servatron::Application

  def initialize root
    @root = Servatron::Path.new File.expand_path(root)
  end
  attr_reader :root

  # def start
  #   Servatron::Server.new(self).start
  # end

  # def port
  #   @port ||= options[:port] || 3000
  # end

  # def app_root
  #   @app_root ||= Servatron::Path.new(options[:app_root] || Bundler.root)
  # end

end
