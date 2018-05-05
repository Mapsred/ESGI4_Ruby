class ApplicationController < ActionController::Base
  helper_method :active_link

  def active_link(link_path)
    if(request.env['PATH_INFO'] == link_path)
      return true
    end
    return false
  end
end
