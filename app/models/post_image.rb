class PostImage < ApplicationRecord

    belongs_to :user
    attachment :image

    has_many :favorites, dependent: :destroy
    has_many :post_comments, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(keyword)
  where(["title like? OR introduction like?", "%#{keyword}%", "%#{keyword}%"])
  end

end
