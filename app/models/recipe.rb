class Recipe < ApplicationRecord
     has_one_attached :recipe_image
     #recipeテーブルから中間テーブルに対する関連付け
     #has_many :recipe_breed_relations, dependent: :destroy
      #breedテーブルから中間テーブルを介してTagsテーブルへの関連付け
     #has_many :breeds through: :recipe_breed_relations, dependent: :destroy
     belongs_to :breed
     belongs_to :user
     #いいね機能
     has_many :favorites, dependent: :destroy
     has_many :favorited_users, through: :favorites, source: :user
     #コメント機能
     has_many :user_comments, dependent: :destroy
     #公開、非公開機能の判断メソッド
      scope :published, -> {where(is_active: true)}
      scope :unpublished, -> {where(is_active: false)}
      
      validates :title, presence: true,length:{maximum:50}
      validates :main_text, presence: true,length:{maximum:1000}
     
     
     def favorited?(user)
     favorites.where(user_id: user.id).exists?
     end
     
    def self.search(keyword)
      where('title LIKE(?)', "%#{keyword}%")
    end
     
end
