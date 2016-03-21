class HomeController < ApplicationController
  before_action :require_login
  def index
    @enrollments = Enrollment.where(email:current_user.email)
  end
end
