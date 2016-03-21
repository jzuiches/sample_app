class Training < ActiveRecord::Base
  belongs_to :training_division
  belongs_to :user
  has_many :trainings_training_codes, dependent: :destroy
  has_many :training_codes, through: :trainings_training_codes, dependent: :destroy
  default_scope -> { order(training_date: :desc) }
  validates :user_id, presence: true
  validates :training_division_id, presence: true
  validates :training_date, presence: true
  accepts_nested_attributes_for :trainings_training_codes

end

