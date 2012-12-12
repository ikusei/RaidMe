class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :first_name, :last_name, :roomnumber, :product_ids, :points
  # attr_accessible :title, :body

  has_many :product_arrangements, :dependent => :destroy
  has_many :products

  has_many :fridge_friends  

  validates_uniqueness_of :email
  
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
	  user = User.where(:provider => auth.provider, :uid => auth.uid).first
	  unless user
	    user = User.create(provider:auth.provider,
	                         uid:auth.uid,
	                         email:auth.info.email,
	                         password:Devise.friendly_token[0,20]
	                         )
	  end
	  user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

   def self.find_products( wanted_products )
    # ids have to be integers, have to be uniq, cannot be 0
    product_ids = wanted_products.map(&:to_i).uniq.keep_if{|id| id > 0 }

    no_of_products = product_ids.length

    # turn into a string, separated by commas
    product_ids_csv = product_ids.join(",")

    user_ids = Product.find_by_sql(<<-END_SQL).map{|r| r.user_id}
      SELECT user_id, count(user_id) 
      FROM products 
      WHERE id IN ( #{product_ids_csv} ) 
      GROUP BY user_id 
      HAVING count(user_id) = #{no_of_products}
    END_SQL

    User.find( user_ids )
  end
end
