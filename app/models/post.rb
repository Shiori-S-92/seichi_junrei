class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy

  has_many_attached :images

  validates :title, presence: true
  validates :content, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :images, presence: true

  # mount_uploaders :images, ImageUploader
  # serialize :images, JSON

  # def prefecture_name
  #   JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  # end

  # def prefecture_name=(prefecture_name)
  #   self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  # end

end
