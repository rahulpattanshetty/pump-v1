class ReadingsController < ApplicationController
  def index
  end

  def update
  end

  def show
	@reading = Reading.find(params[:id])

  end
end
