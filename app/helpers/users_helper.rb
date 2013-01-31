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

	def be_friend
	  friend = FridgeFriend.find(:first, :conditions => "user_id = '#{current_user.id}' AND friend_id = '#{@user.id}' ")
	  befriended = FridgeFriend.find(:first, :conditions => "friend_id = '#{current_user.id}' AND user_id = '#{@user.id}' ")
	  if friend.present? && befriended.present?
	  	return true;
	  else
	  	return false;
	  end
	end
end