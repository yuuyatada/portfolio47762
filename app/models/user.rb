class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         validates :name, presence: true
         validates :message,length: { maximum: 50 }
         
  has_many :recipes, dependent: :destroy
  has_many :favorites, dependent: :destroy
   #コメント機能
  has_many :user_comments, dependent: :destroy
  
   has_one_attached :profile_image
   
   def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [50, 50]).processed
   end
   
   def status
    if is_deleted == true
      is_deleted = "退会"
    else
      is_deleted = "有効"
    end
   end
   
         
end
