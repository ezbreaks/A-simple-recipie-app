class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  
  def index
    @recipes = Recipe.all.order('created_at DESC')
  end
  
  def show
      # @recipe = Recipe.find(params[:id])
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = Chef.find(1)
    
    if @recipe.save
      flash[:success] = "Recipe was successfully created."
      redirect_to @recipe
    else 
      render :new
    end
   
  end
  
  def edit
  end
  
  def update
    if @recipe.update(recipe_params)
      flash[:success] = "Recipe was successfully updated."
      redirect_to @recipe
    else 
      render 'edit'
    end
  end
  
  def destroy
  end
  
  
  
  private
  
  def recipe_params
    params.require(:recipe).permit(:name, :summary, :description)
  end
    
  
  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
  
end