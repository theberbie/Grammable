class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  def render_not_found(status=:not_found)
    render text: "#{status.to_s.titleize} :(", status: status
  end

  protect_from_forgery with: :exception
end
