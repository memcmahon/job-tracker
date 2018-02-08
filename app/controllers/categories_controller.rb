class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    call_category
  end

  def new
    @category = Category.new()
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
    call_category
  end

  def update
    call_category
    if @category.update(category_params)
      redirect_to categories_path
    else
      redirect_to edit_category_path(@category)
    end
  end

  def destroy
    call_category
    @category.destroy
    redirect_to categories_path
  end

  private

  def call_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end
end
