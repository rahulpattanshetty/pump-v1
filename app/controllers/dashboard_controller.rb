class DashboardController < ApplicationController
  def sales
  	@sales = Sale.all
  end
end
