class User < ActiveRecord::Base
before_save :create_avatar_url
before_validation :prep_email
has_secure_password
def user_params
      params.require(:user).permit(:avatar_url,:name,:username, :email, :password, :password_confirmation)
    end

validates :name, presence: true
validates :username, uniqueness: true, presence: true
validates :email, uniqueness: true, presence: true, format: { with: /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i }

def create_avatar_url
    self.avatar_url = "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.email)}?s=50"
end
private
 
def prep_email
    self.email = self.email.strip.downcase if self.email
end

end
