class CompaniesController < ApplicationThinController
  include FavoritableController

  before_action :authenticate_user!
  before_action :load_resource, only: [:show]
  authorize_resource

  def index
    @companies = Company.all
    respond_with @companies
  end

  def show
    respond_with @company
  end

  private

  def include_resources
    [:people]
  end
end
