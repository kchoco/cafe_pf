class PostImage < ApplicationRecord

  belongs_to :user
  attachment :image

  validates :image, {presence: true}

  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  #地図機能
  has_one :spot, dependent: :destroy
  accepts_nested_attributes_for :spot


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(keyword)
  where(["title like? OR introduction like?", "%#{keyword}%", "%#{keyword}%"])
  end

  #タグ付け
  acts_as_taggable
  acts_as_taggable_on :skills, :interests


end
