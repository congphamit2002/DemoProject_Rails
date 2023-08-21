class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, except: %i[index create new]
  
  def index
    @categories = Category.all
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
end
