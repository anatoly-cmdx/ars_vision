require "application_responder"

class ApplicationThinController < ApplicationController
  self.responder = ApplicationResponder
  respond_to :html

  private

  # before_action :load_resource, only: [:show, :update, :destroy, ...]
  # :include_resources may be overriden in controller
  def load_resource
    record = resource_model.includes(include_resources).find(params[:id])
    instance_variable_set("@#{resource_name}", record)
  end

  # :permit_attributes must be overriden in controller
  def resource_params
    strong_params = params.require(resource_name.to_sym).permit(*permit_attributes)
    strong_params.merge(user_id: current_user.id) if user_signed_in?
  end

  def resource_model
    @resource_model ||= controller_name.classify.constantize
  end

  def resource_name
    @resource_name ||= controller_name.singularize
  end

  def resource
    @resource ||= instance_variable_get("@#{resource_name}")
  end

  def include_resources
    []
  end

  def permit_attributes
    []
  end
end
