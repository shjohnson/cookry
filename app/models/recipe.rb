class Recipe < ActiveRecord::Base
  include Filterable
  default_scope { order('created_at ASC') }

  # attr_accessor :rating, :name

  belongs_to :user, foreign_key: 'user_id'
  has_many :ingredients
  has_many :comments

  validates :name, presence: true
  validates :rating, presence: true
  validates :user_id, presence: true
end
