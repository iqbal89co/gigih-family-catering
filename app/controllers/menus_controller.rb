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
end
