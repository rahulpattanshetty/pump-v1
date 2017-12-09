class CreditsController < ApplicationController
  before_action :set_credit, only: [:show, :edit, :update, :destroy]

  # GET /credits
  # GET /credits.json
  def index
    @credits = Credit.all
  end

  # GET /credits/1
  # GET /credits/1.json
  def show
  end

  # GET /credits/new
  def new
    @credit = Credit.new
  end

  # GET /credits/1/edit
  def edit
  end

  # POST /credits
  # POST /credits.json
  def create

    @credit = Credit.new(credit_params)
   # binding.pry
   
    
    respond_to do |format|
      if @credit.save
        format.html { redirect_to credits_path, notice: 'Credit was successfully created.' }
        format.json { render :show, status: :created, location: @credit }
        format.js   
      else
        format.html { render :new }
        format.json { render json: @credit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credits/1
  # PATCH/PUT /credits/1.json
  def update
    respond_to do |format|
      if @credit.update(credit_params)
        format.html { redirect_to @credit, notice: 'Credit was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit }
      else
        format.html { render :edit }
        format.json { render json: @credit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credits/1
  # DELETE /credits/1.json
  def destroy
    if params[:id]
      @daily_id = Credit.find(params[:id]).daily_id
      @credit.destroy
      respond_to do |format|
        format.html { redirect_to daily_path(@daily_id), notice: 'Credit was successfully destroyed.' }
        format.json { head :no_content }
         format.js
       end
    else
      @daily_id = @credit.daily_id  
      @credit.destroy
      respond_to do |format|
        format.html { redirect_to daily_path(@daily_id), notice: 'Credit was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit
      @credit = Credit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_params
      params.require(:credit).permit(:name, :phone_number, :oil_type, :rate, :litres, :amount, :purchase_date, :is_paid, :paid_date, :cash_paid,:daily_id)
    end
end
