class OrderMenuController < ApplicationController
  def create
    order_menu = OrderMenu.new(order_menu_params)
    respond_to do |format|
      if order_menu.save
        format.html {
          redirect_to menu_url(order_menu), notice: "New Menu was successfully added to order."
        }
        format.json {
          render :show, status: :created, location: order_menu
        }
      else
        format.html {
          render :new, status: :unprocessable_entity
        }
        format.json {
          render json: order_menu.errors, status: :unprocessable_entity
        }
      end
    end
  end

  def destroy
    order_menu = OrderMenu.get_order_menu(params[:id])
    respond_to do |format|
      if order_menu.destroy
        format.html {
          redirect_to menus_url, notice: "Menu was successfully deleted for the order."
        }
        format.json {
          render :index, status: :destroyed, location: order_menu
        }
      else
        format.html {
          render :show, status: :unprocessable_entity
        }
        format.json {
          render json: order_menu.errors, status: :unprocessable_entity
        }
      end
    end
  end
  
  private
  def order_menu_params
    params.require(:order_menu).permit(:order_id, :name, :price, :qty)
  end
end
