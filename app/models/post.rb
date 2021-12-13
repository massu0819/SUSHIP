class Post < ApplicationRecord
  has_many :comments
  has_many :favorites
  belongs_to :customer
  attachment :postimage
end
