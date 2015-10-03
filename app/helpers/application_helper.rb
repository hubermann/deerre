module ApplicationHelper


	def business_manager_groups(idbm)
		@groups = Group.where(business_manager_id: idbm)
	end

end
