class Account < ActiveRecord::Base
  has_many :users
  has_many :events
  
  accepts_nested_attributes_for :users
end