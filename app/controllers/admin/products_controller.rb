module Admin
  class ProductsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_product, except: %i[index new create]

    def index
      @products = Product.all
    end

    def new
      @product = Product.new
      @product.product_categories.build
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to admin_products_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @product.update(product_params)
        redirect_to admin_products_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title, :description, :price, :quantity_available, :image,
                                      category_ids: [])
    end
  end
end