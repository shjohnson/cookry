class Ingredient < ActiveRecord::Base
  default_scope { order('created_at ASC') }

  belongs_to :recipe, foreign_key: 'recipe_uuid'

  validates :name, presence: true
  validates :amount, presence: true
end
