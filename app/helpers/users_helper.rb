module UsersHelper
	def banned(user)
		user.blocked ? t('.unban'):	t('.ban')
	end
	def ban_class(user)
		user.blocked ? "success" :	'danger'
	end
end
