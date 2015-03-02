class Comment < ActiveRecord::Base
  default_scope { order('created_at ASC') }

  belongs_to :user, foreign_key: 'user_id'
  belongs_to :recipe, foreign_key: 'recipe_id'

  validates :message, presence: true
  validates :user_id, presence: true
  validates :recipe_id, presence: true
end
