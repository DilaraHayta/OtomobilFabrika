class CarOrdersController < ApplicationController
  before_action :set_car_order, only: [:show, :edit, :update, :destroy]

  # GET /car_orders
  # GET /car_orders.json
  def index
    @car_orders = CarOrder.all
  end

  # GET /car_orders/1
  # GET /car_orders/1.json
  def show
  end

  # GET /car_orders/new
  def new
    @car_order = CarOrder.new
  end

  # GET /car_orders/1/edit
  def edit
  end

  # POST /car_orders
  # POST /car_orders.json
  def create
    @car_order = CarOrder.new(car_order_params)

    respond_to do |format|
      if @car_order.save
        format.html { redirect_to @car_order, notice: 'Car order was successfully created.' }
        format.json { render :show, status: :created, location: @car_order }
      else
        format.html { render :new }
        format.json { render json: @car_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /car_orders/1
  # PATCH/PUT /car_orders/1.json
  def update
    respond_to do |format|
      if @car_order.update(car_order_params)
        format.html { redirect_to @car_order, notice: 'Car order was successfully updated.' }
        format.json { render :show, status: :ok, location: @car_order }
      else
        format.html { render :edit }
        format.json { render json: @car_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /car_orders/1
  # DELETE /car_orders/1.json
  def destroy
    @car_order.destroy
    respond_to do |format|
      format.html { redirect_to car_orders_url, notice: 'Car order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def invoice
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car_order
      @car_order = CarOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_order_params
      params.require(:car_order).permit(:customer, :orderDate, :deliveryDate, :adet, :fiyat, :status, :car_id,:part_id,:cname,:pname)
    end
end
