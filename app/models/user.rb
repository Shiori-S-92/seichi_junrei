class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  ## name：一意性を持たせ、かつ2～20文字の範囲で設定
  # validates :name, uniqueness: true
  validates :name, presence: true, uniqueness: true, length: { in: 2..20 }

end
