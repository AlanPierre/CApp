class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :authenticate_user!
  include PublicActivity::StoreController 
  include ActionView::Helpers::TextHelper
  before_filter :authenticate_user!
    
   layout '../default/application'
    
rescue_from CanCan::AccessDenied do |exception|
    redirect_to access_denied_url
  end


def authenticate_admin!
 redirect_to new_user_session_path unless current_user.has_role? :SuperAdmin
end

    
end


