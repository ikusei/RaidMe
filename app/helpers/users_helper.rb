module UsersHelper

	def gravatar_for(user, options = { :size => 57 })
	    gravatar_image_tag(user.email.downcase, :alt => h(user.email),
	                                            :class => 'gravatar',
	                                            :gravatar => options)
	end

	def get_friend
	  return FridgeFriend.find(:first, :conditions => { :user_id => current_user.id })
	end

	def get_arrangement
	  return ProductArrangement.find(:first, :conditions => { :user_id => current_user.id })
	end

end