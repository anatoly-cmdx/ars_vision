class FavoritesController < ApplicationThinController
  before_action :authenticate_user!
  authorize_resource

  def index
    @favorites = current_user.favorites
    respond_with @favorites
  end
end
