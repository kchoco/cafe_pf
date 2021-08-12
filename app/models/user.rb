class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_images, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def active_for_authentication?
    super && (self.is_valid == false)
  end
end
