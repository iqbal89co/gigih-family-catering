require 'json'
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
    @category = Category.all
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
    menu = Menu.new(menu_params)
    respond_to do |format|
      if menu.save
        format.html {
          redirect_to menu_url(menu), notice: "Menu was successfully created."
        }
        format.json {
          render :show, status: :created, location: menu
        }
      else
        format.html {
          render :new, status: :unprocessable_entity
        }
        format.json {
          render json: menu.errors, status: :unprocessable_entity
        }
      end
    end
  end

  def update
    menu = Menu.get_menu(params[:id])
    respond_to do |format|
      if menu.update(menu_params)
        format.html {
          redirect_to menu_url(menu), notice: "Menu was successfully updated."
        }
        format.json {
          render :show, status: :updated, location: menu
        }
      else
        format.html {
          render :edit, status: :unprocessable_entity
        }
        format.json {
          render json: menu.errors, status: :unprocessable_entity
        }
      end
    end
  end

  def destroy
    menu = Menu.get_menu(params[:id])
    respond_to do |format|
      if menu.destroy
        format.html {
          redirect_to menus_url, notice: "Menu was successfully deleted."
        }
        format.json {
          render :index, status: :destroyed, location: menu
        }
      else
        format.html {
          render :show, status: :unprocessable_entity
        }
        format.json {
          render json: menu.errors, status: :unprocessable_entity
        }
      end
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:name, :description, :price, :category_id)
  end
end
