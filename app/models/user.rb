class User < ActiveRecord::Base
has_many :ribbits	
before_save :create_avatar_url
before_validation :prep_email
has_secure_password
validates :name, presence: true
validates :username, uniqueness: true, presence: true
validates :email, uniqueness: true, presence: true, format: { with: /\A[\w.+-]+@([\w]+.)+\w+\Z/}
def user_params
      params.require(:user).permit(:avatar_url,:name,:username, :email, :password, :password_confirmation)
    end
def create_avatar_url
    self.avatar_url = "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.email)}?s=50"
end


private
 
def prep_email
    self.email = self.email.strip.downcase if self.email

end
end
