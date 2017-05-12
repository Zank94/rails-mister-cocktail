class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @review = Review.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktails_params)
    @cocktail.save
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(cocktails_params)
    redirect_to cocktail_path(@cocktail)
  end

  def research
    @cocktails = Cocktail.where("name LIKE '%#{params[:research]}%'")
  end

  def cocktails_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
