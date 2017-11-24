class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.photo = params[:cocktail][:photo]
    # @cocktail.update(cocktail_params)
    @dose = Dose.new
    if @cocktail.save
      # nouvelle requete HTTP
      redirect_to cocktail_path(@cocktail)
    else
      # afficher les erreurs si on a pas bien rempli le form
      render :show
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
