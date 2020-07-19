# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email          (email)
#  index_users_on_session_token  (session_token)
#
class User < ApplicationRecord
    attr_reader :password
 
    validates :email, :password_digest, :session_token, presence: true
    validates :password, length: { minimum: 6, allow_nil: true }
    
    before_validation :ensure_session_token 


    def self.generate_session_token
        SecureRandom::urlsafe_base64(16) 
    end

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        user.nil? ? nil : user.is_password?(password) ? user : nil
        
    end

    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        real_pd = self.password_digest
        BCrypt::Password.new(real_pd).is_password?(password)
    end
    

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end



end
