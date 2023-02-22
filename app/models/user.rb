class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         validates :name, presence: true,length:{maximum:20}
         validates :message,length: { maximum: 50 }
         
  has_many :recipes, :dependent => :destroy
  has_many :favorites, :dependent => :destroy
   #コメント機能
  has_many :user_comments,:dependent => :destroy
  before_destroy :unpublish
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
   
   def active_for_authentication?
    super && (is_deleted == false)
   end
   
   def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト" 
    end
   end

private
  def unpublish
    Recipe.where("user_id = ?", self.id).update_all("is_active = false")
  end


end
