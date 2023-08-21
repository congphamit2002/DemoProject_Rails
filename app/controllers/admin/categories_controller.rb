class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, except: %i[index create new]
  
  def index
    @categories = Category.all
  end

  def new 
    @category = Category.new
  end

  def create
    p "Params #{category_params}"
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
    else 
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    if @category.destroy
      redirect_to admin_categories_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
