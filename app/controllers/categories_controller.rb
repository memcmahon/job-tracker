class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      redirect_to new_category_path
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def destroy
    Category.destroy(params[:id])
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
