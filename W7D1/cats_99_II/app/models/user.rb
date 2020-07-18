# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  password_digest :string           not null
#  session_token   :string           not null
#  user_name       :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_session_token  (session_token) UNIQUE
#

class User < ApplicationRecord
    attr_reader :password
    validates :user_name,uniqueness:true, presence: true
    validates :password_digest, presence: {message: 'password cannot be blank'}
    validates :password,length: {minimum: 6, allow_nill:true}
    validates :session_token, uniqueness:true

    def self.find_by_credentials(user_name, password)
        user = User.find_by(user_name: user_name)
        user.nil? ? nil : user.is_password?(password) ? user : nil
    end

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64(16)
        self.save!
        self.session_token
    end

    
    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end



end
