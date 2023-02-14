class Recipe < ApplicationRecord
     has_one_attached :recipe_image
     belongs_to :user
     #いいね機能
     has_many :favorites, dependent: :destroy
     #コメント機能
     has_many :user_comments, dependent: :destroy
     #いいね機能の判断メソッド
      scope :published, -> {where(is_active: true)}
      scope :unpublished, -> {where(is_active: false)}
     
     
     def favorited?(user)
     favorites.where(user_id: user.id).exists?
     end
     
end
