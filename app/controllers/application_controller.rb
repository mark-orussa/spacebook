class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :foo

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || galaxies_path
  end

  def execute_statement(sql)
    results = ActiveRecord::Base.connection.execute(sql)
    if results.present?
      return results
    else
      return nil
    end
  end

  def foo
    @notification_count = Galaxy.get_notification_count(current_user)
    @notifications = Galaxy.get_notifications(current_user)
  end
end
