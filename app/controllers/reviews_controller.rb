class ReviewsController < ApplicationController

  def create
    @review = Review.new(reviews_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review.cocktail = @cocktail
    @review.save
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      @dose = Dose.new
      render "cocktails/show"
    end
  end

  def reviews_params
    params.require(:review).permit(:rating, :content)
  end
end
