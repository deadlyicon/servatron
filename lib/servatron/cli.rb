require 'slop'

class Servatron::CLI

  def self.start

    Slop.parse strict: true, help: true do
      banner 'Usage: servatron [options]'

      command 'server' do
        on 'port=', 'set the port of the server'
        on 'app_root=', 'the root directory of your app'
        run do |options, args|
          Servatron.new(options.to_hash).start
          exit
        end
      end

      command 'console' do
        run do |options, args|
          require 'pry'
          Pry.start Servatron
          exit
        end
      end

    end

  end

end



# require 'slop'
# require 'servatron'

# options = Slop.parse strict: true, help: true do
#   banner 'Usage: servatron [options]'

#   command 'server' do

#     on 'port=', 'set the port of the server'
#     run do |options, args|

#       require ''

#       ENV['RACK_ENV'] ||= 'development'
#       config = File.expand_path('../../config.ru', __FILE__)

#       port = options[:port] || 3000

#       # options = {:Port => 9393, :Host => '127.0.0.1', :AccessLog => [], :Path => '/'}

#       if ENV['RACK_ENV'] == 'development'
#         require 'shotgun'
#         app = Shotgun::Loader.new(config)
#         Rack::Server.new(app: app, :Port => port).start
#       else
#         require 'rack'
#         Rack::Server.new(config: config, :Port => port).start
#       end
#       exit
#     end
#   end

#   command 'console' do
#     run do |options, args|
#       require 'pry'
#       Pry.start Servatron
#       exit
#     end
#   end

# end

# # default start deamon

# puts options
# exit

# # require "rubygems"
# # gem 'sass'
# # require "sinatra"
# # require "haml"
# # require "launchy"

# # set :public_dir, '.'
# # set :views, '.'

# # get '/' do
# #   return haml :index if File.exist?('index.haml')
# #   return File.read('index.html') if File.exist?('index.html')
# #   404
# # end

# # get '/*.css' do |path|
# #   # content_type 'text/css'
# #   path = "#{path}.sass"
# #   return sass File.read(path) if File.exist? path
# #   404
# # end

# # if ARGV.empty?
# #   Launchy.open "http://localhost:4567"
# # else
# #   ARGV.each do |file|
# #     Launchy.open(File.join("http://localhost:4567", file))
# #   end
# # end
