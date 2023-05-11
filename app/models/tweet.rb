class Tweet < ApplicationRecord

  # Assosiacion
  has_one_attached :image
  belongs_to :user
  has_many :likes, dependent: :destroy

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
  
end
