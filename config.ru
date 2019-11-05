require './config/environment'

use Rack::MethodOverride
use SessionsController
run ApplicationController