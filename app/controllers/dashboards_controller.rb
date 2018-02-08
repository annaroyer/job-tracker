class DashboardsController < ApplicationController
  def show
    @jobs = Job.all
    @top_companies = Company.top_average_interest_level
  end
end
