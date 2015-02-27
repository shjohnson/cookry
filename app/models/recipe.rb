class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients
  has_many :comments

  validates :name, presence: true
  validates :rating, presence: true
  validates :user_id, presence: true
end
