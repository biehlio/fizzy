class CategoriesController < ApplicationController
  before_action :set_category, only: :destroy
  before_action :set_splat, only: %i[ new create ]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.find_or_create_by(category_params)
    @category.save

    @category.splats << @splat
    redirect_to splat_path(@splat)
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def set_splat
    @splat = Splat.find(params[:splat_id])
  end
end
