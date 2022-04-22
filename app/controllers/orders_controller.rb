class OrdersController < ApplicationController
  def index
    @orders = Order.get_all
    if params.has_key?(:filter)
      if params[:filter] == 'email'
        @orders = Order.filter_by_email(params[:element])
      end
    end
    respond_to do |format|
      format.html {
        @orders
      }
      format.json {
        render :json => @orders
      }
    end
  end

  def show
    @order = Order.get_order(params[:id])
    respond_to do |format|
      format.html {
        @order
      }
      format.json {
        render :json => @order
      }
    end
  end

  def new
    if params.has_key?(:customer_id)
      @customer = Customer.get_customer(params[:customer_id])
    end
    @customer = Customer.new
    @order = Order.new
  end

  # edit status order
  def edit
    @order = Order.get_order(params[:id])
    respond_to do |format|
      format.html {
        @order
      }
      format.json {
        render :json => @order
      }
    end
  end

  def update
    order = Order.get_order(params[:id])
    
    respond_to do |format|
      if order.update(order_params)
        format.html {
          redirect_to menu_url(order), notice: "Order was successfully updated."
        }
        format.json {
          render :show, status: :updated, location: order
        }
      else
        format.html {
          render :edit, status: :unprocessable_entity
        }
        format.json {
          render json: order.errors, status: :unprocessable_entity
        }
      end
    end
  end

  def create
    order = Order.new(order_params)
    respond_to do |format|
      if order.save
        format.html {
          redirect_to menu_url(order), notice: "Order was successfully created."
        }
        format.json {
          render :show, status: :created, location: order
        }
      else
        format.html {
          render :new, status: :unprocessable_entity
        }
        format.json {
          render json: order.errors, status: :unprocessable_entity
        }
      end
    end
  end

  def destroy
    order = Order.get_order(params[:id])
    respond_to do |format|
      if order.destroy
        format.html {
          redirect_to menus_url, notice: "Order was successfully deleted."
        }
        format.json {
          render :index, status: :destroyed, location: order
        }
      else
        format.html {
          render :show, status: :unprocessable_entity
        }
        format.json {
          render json: order.errors, status: :unprocessable_entity
        }
      end
    end
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :status)
  end
  
end
