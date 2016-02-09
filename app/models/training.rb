class Training < ActiveRecord::Base
  belongs_to :training_division
  belongs_to :user
  default_scope -> { order(training_date: :desc) }
  validates :user_id, presence: true
  validates :training_division, presence: true
end
