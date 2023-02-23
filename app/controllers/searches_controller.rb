class SearchesController < ApplicationController

  def search
    @recipes = Recipe.published.search(params[:keyword])
    @keyword = params[:keyword]
  end

 
end
