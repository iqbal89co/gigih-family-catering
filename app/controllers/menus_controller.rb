class MenusController < ApplicationController
  def index
    @menus = Menu.get_all_menus
    respond_to do |format|
      format.html {
        @menus
      }
      format.json {
        render :json => @menus
      }
    end
  end
  def show
    @menu = Menu.get_menu(params[:id])
    respond_to do |format|
      format.html {
        @menu
      }
      format.json {
        render :json => @menu
      }
    end
  end
  def new
    @menu = Menu.new
  end
  def edit
    @menu = Menu.get_menu(params[:id])
    respond_to do |format|
      format.html {
        @menu
      }
      format.json {
        render :json => @menu
      }
    end
  end
  def create
    @menu = Menu.new(menu_params)
    # @menu_category = MenuCategory.new(menu_category_params)
    respond_to do |format|
      if @menu.save
        format.html {
          redirect_to menu_url(@menu), notice: "Menu was successfully created."
        }
        format.json {
          render :show, status: :created, location: @menu
        }
      else
        format.html {
          render :new, status: :unprocessable_entity
        }
        format.json {
          render json: @menu.errors, status: :unprocessable_entity
        }
      end
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:name, :description, :price)
  end
  # def menu_category_params
  #   params.require(:menu_category).permit(:category_id, :menu_id)
  # end
end
