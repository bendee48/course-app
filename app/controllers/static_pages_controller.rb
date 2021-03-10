class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing_page]

  def landing_page
    @latest_courses = Course.order(created_at: :desc).three
    @courses = Course.three
  end

  def privacy_policy
  end
end
