class User < ActiveRecord::Base
has_secure_password
attr_accessible :avatar_url, :email, :name, :password, :password_confirmation, :username
validates :name, presence: true
validates :username, uniqueness: true, presence: true
validates :email, uniqueness: true, presence: true, format: { with: /^[\w.+-]+@([\w]+.)+\w+$/ }
private
 
def prep_email
    self.email = self.email.strip.downcase if self.email
end
end
