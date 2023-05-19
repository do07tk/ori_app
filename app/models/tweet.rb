class Tweet < ApplicationRecord

  # Assosiacion
  has_one_attached :image
  belongs_to :user
  has_many :likes, dependent: :destroy

  # validate
  validates :image, :title, :content, presence: true
  validates :title, { length: { maximum: 10 }}
  validates :content, { length: {maximum: 1000 }}

  def self.search(search)
    if search != ""
      Tweet.where('title LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
  
end
