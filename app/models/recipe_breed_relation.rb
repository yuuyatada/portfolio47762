class RecipeBreedRelation < ApplicationRecord
  belongs_to :recipe
  belongs_to :breed
end
