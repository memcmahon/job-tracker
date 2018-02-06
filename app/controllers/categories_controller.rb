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

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_path
    else
      redirect_to edit_category_path(@category)
    end
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
