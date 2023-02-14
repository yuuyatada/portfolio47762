class CreateRecipeBreedRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_breed_relations do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :breed, null: false, foreign_key: true

      t.timestamps
    end
  end
end
