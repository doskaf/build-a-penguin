require './config/environment'

use Rack::MethodOverride
use SessionsController
use PenguinsController
use UsersController
run ApplicationController