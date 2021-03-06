class Invite < ActiveRecord::Base
	attr_accessible :email, :email_sent

	validates :email, :presence => true,
				 	  :uniqueness => { :case_sensitive => false },
					  :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

	def self.find_all_emails
		find(:all)
	end

	def self.get_total_emails
		Invite.count(:id, :distinct => true)
	end
end
