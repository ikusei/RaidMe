module UsersHelper

	def gravatar_for(user, options = { :size => 57 })
	    gravatar_image_tag(current_user.email.downcase, :alt => h(user.email),
	                                            :class => 'gravatar',
	                                            :gravatar => options)
	end
end