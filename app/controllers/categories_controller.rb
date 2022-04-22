class CategoriesController < ApplicationController
  def index
    @categories = Category.allocate
    @categories
  end
end
