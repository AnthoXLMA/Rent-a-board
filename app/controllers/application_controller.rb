class ApplicationController < ActionController::Base
  # before_action :set_time_zone, if: :logged_in?

private

def set_time_zone
  Time.zone = current_user.time_zone
end

end
