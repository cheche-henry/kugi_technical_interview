class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :user

  has_many :comments, dependent: :destroy
  

  validates :title, :summary, :body, presence: true
end
