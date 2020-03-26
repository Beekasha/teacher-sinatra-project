require './config/environment'


if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride #any time you need to use PATCH / DELETE requests
use SessionsController
use StudentsController
use KlassesController
use ReviewsController
use TeachersController
run ApplicationController
