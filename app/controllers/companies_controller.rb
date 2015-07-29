class CompaniesController < ApplicationThinController
  before_action :authenticate_user!
  authorize_resource

  def index
    @companies = Company.all
    respond_with @companies
  end

  private

  def include_resources
    [:person]
  end
end
