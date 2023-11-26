class CategoriesController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @categories = Category.all
    end
  
    def show
      @category = Category.find(params[:id])
      @transactions = @category.transactions.order(created_at: :desc)
      @total_amount = @transactions.sum(:amount)
    end
  
    def new
      @category = Category.new
    end
  
    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to categories_path, notice: 'Category was successfully created.'
      else
        render :new
      end
    end
  
    def update
      @category = Category.find(params[:id])
      if @category.update(category_params)
        redirect_to @category, notice: 'Category was successfully updated.'
      else
        render :edit
      end
    end
  
    private
  
    def category_params
      params.require(:category).permit(:name, :icon)
    end
  end
  