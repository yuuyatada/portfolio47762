class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         validates :name, presence: true
         
  has_many :recipes, dependent: :destroy
  has_many :favorites, dependent: :destroy
   #コメント機能
  has_many :user_comments, dependent: :destroy
         
end
