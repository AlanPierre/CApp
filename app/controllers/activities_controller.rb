class ActivitiesController < ApplicationController
  def index
    @activities = PublicActivity::Activity.order("created_at desc")
    @activities_days = @activities.group_by { |t| t.created_at.beginning_of_day}
  end
end
