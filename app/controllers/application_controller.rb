class ApplicationController < ActionController::Base
  before_action :authenticate_usuario!
  layout :establecer_template

  protected

  def establecer_template
    devise_controller? ? "publico" : "application"
  end
end
