class CategoriesController < ApplicationController
  # before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    # @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was successfully created"
      redirect_to @category
    else
      render 'new'
    end
  end

  private

  def set_category
    # @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

end