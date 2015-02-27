class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe

  validates :message, presence: true
  validates :user_id, presence: true
  validates :recipe_id, presence: true
end
