require 'sinatra/base'

class Manager < Sinatra::Base

  run! if app_file == $0 

end