class MenusController < ApplicationController
  def index
    @menus = Menu.get_all_menus
    @menus
  end
  def show
    @menu = Menu.get_menu(params[:id])
    @menu
  end
  def new
    @menu = Menu.new
  end
  def edit
    @menu = Menu.get_menu(params[:id])
    @menu
  end
  def create
    @menu = Menu.new(menu_params)
    respond_to do |format|
      if @menu.save
        format.html {
          redirect_to menu_url(@menu), notice: "Menus was successfully created."
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
end
