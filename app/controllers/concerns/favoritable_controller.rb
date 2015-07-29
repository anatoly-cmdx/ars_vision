module FavoritableController
  extend ActiveSupport::Concern

  included do
    before_action :load_favoritable_resource, only: [:add_to_favorites, :remove_from_favorites]
  end

  def add_to_favorites
    authorize! :favorites, @favoritable
    @favoritable.add_to_favorites current_user
    render_favorites
  end

  def remove_from_favorites
    authorize! :favorites, @favoritable
    @favoritable.remove_from_favorites current_user
    render_favorites
  end

  private

  def load_favoritable_resource
    @favoritable = controller_name.classify.constantize.find(params[:id])
  end

  def render_favorites
    render 'favorites/update'
  end
end
