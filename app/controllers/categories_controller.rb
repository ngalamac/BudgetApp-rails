class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.categories

    # Sort categories based on the sort_by parameter
    @categories = sort_categories(params[:sort_by]) if params[:sort_by].present?
  end

  def show
    @category = current_user.categories.find(params[:id])
    @businesses = @category.businesses.order(created_at: :desc)
    @total_amount = @category.total_amount
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def update
    @category = current_user.categories.find(params[:id])
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  private

  def sort_categories(sort_by)
    case sort_by
    when 'most_ancient'
      @categories.order(created_at: :asc)
    else
      @categories.order(created_at: :desc)
    end
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
