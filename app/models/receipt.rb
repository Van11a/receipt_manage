class Receipt < ApplicationRecord
  belongs_to :user
  validates :usage_date, presence: true
  validates :price, presence: true
  validates :usage, presence: true
  validates :publisher, presence: true
  mount_uploader :img, ImageUploader
end
