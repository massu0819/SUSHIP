class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :customer
  attachment :postimage
  
  validates :name, presence: true
  validates :address, presence: true
  validates :postimage, presence: true
  validates :caption, presence: true
end
