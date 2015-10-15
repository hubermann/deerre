class Group < ActiveRecord::Base
	validates_presence_of :name
	attr_accessor :name, :slug, :business_manager_id
	
	belongs_to :business_manager
	has_many :accounts

	before_save :slug_from_name
	private

	def slug_from_name
		titleorig =self.name
		titleorig= titleorig.downcase
		titleorig.gsub! /['`]/,""
		titleorig.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '-'
		titleorig.gsub! /_+/,"-"
		titleorig.gsub! /\A[_\.]+|[_\.]+\z/,""

		self.slug = titleorig
	end



end
