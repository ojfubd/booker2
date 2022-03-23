class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  validates :title, presence: true
  validates :body, length: {  maximum: 200 }, presence: true
  validates :user_id, presence: true
end
