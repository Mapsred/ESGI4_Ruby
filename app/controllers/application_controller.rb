# frozen_string_literal: true

# Application Controller
class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :active_link

  def active_link(link_path)
    return true if request.env['PATH_INFO'] == link_path

    false
  end
end
