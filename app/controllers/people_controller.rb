class PeopleController < ApplicationThinController
  include FavoritableController

  before_action :authenticate_user!
  authorize_resource
end
