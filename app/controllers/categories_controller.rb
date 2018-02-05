class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :destroy, :edit, :update]
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success]="You created #{@category.title} category"
      redirect_to category_path(@category)
    else
      redirect_to new_category_path
    end
  end

  def show
  end

  def index
    @categories = Category.all
  end

  def destroy
    @category.destroy
    flash[:success] = "You deleted #{@category.title} category"
    redirect_to categories_path
  end

  private

    def category_params
      params.require(:category).permit(:title)
    end

    def set_category
      @category = Category.find(params[:id])
    end
end
