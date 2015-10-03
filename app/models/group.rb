class Group < ActiveRecord::Base
	attr_accessor :name, :slug, :business_manager_id
  belongs_to :business_manager
  has_many :accounts
end
