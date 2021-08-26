class PostImage < ApplicationRecord

  belongs_to :user
  attachment :image

  validates :image, {presence: true}

  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  #地図機能
  has_one :spot, dependent: :destroy
  accepts_nested_attributes_for :spot

  #いいね機能
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  #検索機能
  def self.search(keyword)
  where(["title like? OR introduction like? OR tag_list like?" , "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
  end

  #タグ付け
  acts_as_taggable
  acts_as_taggable_on :skills, :interests
end