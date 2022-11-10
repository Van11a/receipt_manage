class User < ApplicationRecord
  has_many :receipts, dependent: :destroy
  has_secure_password validations: true
  validates :login_id, presence: true
  validates :sei, presence: true
  validates :mei, presence: true
  validates :sei_kana, presence: true
  validates :mei_kana, presence: true
end
