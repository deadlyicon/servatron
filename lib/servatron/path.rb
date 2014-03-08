require 'pathname'

class Servatron::Path < Pathname

  def join path
    self.class.new File.join(self.to_s, path)
  end

end
