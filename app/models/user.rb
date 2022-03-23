class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :books, dependent: :destroy

         has_one_attached :profile_image#モデルにimageを持たせるとimage名を定義
         validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
         validates :introduction,length: {  maximum: 50 }
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'#if文の簡略化三項演算式

  end
end
