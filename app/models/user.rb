class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  
  validates :name,  presence: true, length: { maximum: 50 }
  
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, 
            presence: true, 
            length: { maximum: 255 }, 
            format: { with: VALID_EMAIL_REGEX }, 
            uniqueness: { case_sensitive: false }
            
  validates :password, length: { minimum: 6 }
            
  has_secure_password
  
  private
    def user_params
      params.require(:person).permit(:name, :email)
    end
end
