class DosesController < ApplicationController

  # def new
  #   @cocktail = Cocktail.find(params[:cocktail_id])
  #   @dose = Dose.new
  # end

  def create
    @dose = Dose.new(doses_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    @dose.save
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      @review = Review.new
      render "cocktails/show"
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = Cocktail.find(@dose.cocktail_id)
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

private

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
