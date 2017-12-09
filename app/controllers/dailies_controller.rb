 class DailiesController < ApplicationController
  before_action :set_daily, only: [:show, :edit, :update, :destroy]
  
  # GET /dailies
  # GET /dailies.json
  def index
    @dailies = Daily.all
  end

  # GET /dailies/1
  # GET /dailies/1.json
  def show
    @credit = Credit.new
    @credits = Credit.where(daily_id:params[:id])
    @before_reading = Daily.last(2).first
    @reading = Reading.find_by(daily_id:params[:id])
  end

  # GET /dailies/new
  def new
    @last_reading = Daily.last(2)
    @daily = Daily.new
    @credit = Credit.new
  end

  # GET /dailies/1/edit
  def edit
  end

  # POST /dailies
  # POST /dailies.json
  def create
    @daily = Daily.new(daily_params)
    @last_reading = Daily.last

    respond_to do |format|
      if @daily.save
        format.html { redirect_to @daily, notice: 'Daily was successfully created.' }
        format.json { render :show, status: :created, location: @daily }
      else
        format.html { render :new }
        format.json { render json: @daily.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dailies/1
  # PATCH/PUT /dailies/1.json
  def update
    respond_to do |format|
      if @daily.update(daily_params)
        format.html { redirect_to @daily, notice: 'Daily was successfully updated.' }
        format.json { render :show, status: :ok, location: @daily }
      else
        format.html { render :edit }
        format.json { render json: @daily.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dailies/1
  # DELETE /dailies/1.json
  def destroy
    @daily.destroy
    respond_to do |format|
      format.html { redirect_to dailies_url, notice: 'Daily was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily
      @daily = Daily.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daily_params
      params.require(:daily).permit(:d1, :d2, :p1, :p2, :oil, :worker1, :worker2, :daily_date, :access_amount, :short_amount,:diesel_price,:petrol_price,:total)
    end
end
