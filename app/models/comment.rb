class Comment < ActiveRecord::Base
  default_scope { order('created_at ASC') }

  belongs_to :user, foreign_key: 'user_uuid'
  belongs_to :recipe, foreign_key: 'recipe_uuid'

  validates :message, presence: true
  validates :user_id, presence: true
  validates :recipe_id, presence: true
end
