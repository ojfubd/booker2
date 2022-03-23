class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :book_comments, dependent: :destroy
   has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  validates :title, presence: true
  validates :body, length: {  maximum: 200 }, presence: true
  validates :user_id, presence: true
  
end
