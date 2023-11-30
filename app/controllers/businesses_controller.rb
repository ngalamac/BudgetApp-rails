class BusinessesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[index new create]

  def index
    sort_by = params[:sort_by]

    @businesses = case sort_by
                  when 'most_ancient'
                    @category.businesses.order(created_at: :asc)
                  else
                    @category.businesses.order(created_at: :desc)
                  end


    @total_amount = @category.total_amount
  end

  def new
    @business = @category.businesses.build
  end

  def create
    @business = @category.businesses.build(business_params)
    @business.user = current_user

    if @business.save
      redirect_to category_businesses_path(@category), notice: 'Business was successfully created.'
    else
      render :new
    end
  end

  private

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end

  def business_params
    params.require(:business).permit(:name, :amount)
  end
end
