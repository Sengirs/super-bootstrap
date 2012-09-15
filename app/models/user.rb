class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  
  # When an employee is created without a password
  before_validation :generate_password, on: :create
  
  # When a user is created, a welcome email is sent
  after_create :send_welcome_email
  
  def generate_password
    if password.nil? or password.blank?
      generated_password = Devise.friendly_token.first(8)
      
      if Rails.env.test? or Rails.env.development?
        generated_password = "GeneratedPassword"  #For integration tests
      end 
      
      self.password = generated_password
      self.password_confirmation = generated_password
    end
  end
  
  def send_welcome_email
    UserMailer.welcome(self).deliver
  end
  
end
