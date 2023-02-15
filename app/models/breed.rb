class Breed < ApplicationRecord
     #Breedsテーブルから中間テーブルに対する関連付け
     #has_many :recipe_breed_relations, dependent: :destroy
     has_many :recipes #through: :recipe_breed_relations, dependent: :destroy
     
end
