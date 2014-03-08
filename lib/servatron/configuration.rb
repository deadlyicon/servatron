class Servatron::Configuration

  def initialize options={}
    @app_root ||= Servatron::Path.new(options[:app_root] || Bundler.root)
    @port     ||= options[:port] || 3000
  end

  attr_reader :app_root, :port

end
