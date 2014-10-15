class Event < ActiveRecord::Base
  # Associations
  belongs_to :account
  
  # Validations
  validates :name, presence: true
  validates :starting_date, presence: true
  validate :starting_date_cannot_be_in_the_past
  
  def starting_date_cannot_be_in_the_past
    errors[:base] << "Starting date can't be in the past" if starting_date && starting_date < Date.today
  end
end
