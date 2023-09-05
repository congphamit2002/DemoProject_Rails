module Admin
  class CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_category, except: %i[index create new]

    def index
      @categories = Category.all
    end

    def new
      @category = Category.new
    end

    def show; end

    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to admin_categories_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @category.update(category_params)
        redirect_to admin_categories_path
      else
        render :edit, status: :unprocessable_entity
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
      params.require(:category).permit(:name, :image)
    end
  end
end
