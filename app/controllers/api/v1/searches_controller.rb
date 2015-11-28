class Api::V1::SearchesController < ApplicationController
  def index
    @results = County.ransack(params[:term])
    render json: @results.result.limit(10)
  end
end
