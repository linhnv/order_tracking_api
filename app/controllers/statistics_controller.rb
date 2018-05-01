class StatisticsController < ApplicationController
  def index
    statistics = GetStatisticsService.perform
    render json: statistics
  end
end
