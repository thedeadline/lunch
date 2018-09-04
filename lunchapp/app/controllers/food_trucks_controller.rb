class FoodTrucksController < ApplicationController
  before_action :authenticate, :set_food_truck, only: [:show, :edit, :update, :destroy]

  # GET /foodtrucks
  # GET /foodtrucks.json
  def index
    @foodtrucks = FoodTruck.all
  end

  # GET /foodtrucks/1
  # GET /foodtrucks/1.json
  def show
  end

  # GET /foodtrucks/new
  def new
    @foodtruck = FoodTruck.new
  end

  # GET /foodtrucks/1/edit
  def edit
  end

  # POST /foodtrucks
  # POST /foodtrucks.json
  def create
    @foodtruck = FoodTruck.new(food_truck_params)

    respond_to do |format|
      if @foodtruck.save
        format.html { redirect_to @foodtruck, notice: 'FoodTruck was successfully created.' }
        format.json { render :show, status: :created, location: @foodtruck }
      else
        format.html { render :new }
        format.json { render json: @foodtruck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foodtrucks/1
  # PATCH/PUT /foodtrucks/1.json
  def update
    respond_to do |format|
      if @foodtruck.update(food_truck_params)
        format.html { redirect_to @foodtruck, notice: 'FoodTruck was successfully updated.' }
        format.json { render :show, status: :ok, location: @foodtruck }
      else
        format.html { render :edit }
        format.json { render json: @foodtruck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foodtrucks/1
  # DELETE /foodtrucks/1.json
  def destroy
    @foodtruck.destroy
    respond_to do |format|
      format.html { redirect_to food_trucks_url, notice: 'FoodTruck was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_truck
      @foodtruck = FoodTruck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_truck_params
      params.fetch(:food_truck, {})
    end
end
