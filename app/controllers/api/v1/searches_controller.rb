class Api::V1::SearchesController < ApplicationController
  respond_to :json, :js
  def index
    @q = County.ransack(name_cont: params[:term])
    respond_with @q.result.limit(8).map(&:name)
  end
end
