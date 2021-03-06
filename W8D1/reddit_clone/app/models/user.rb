# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  password_digest :string           not null
#  session_token   :string           not null
#  username        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_session_token  (session_token)
#
class User < ApplicationRecord
    attr_reader :password
    
    validates :username, :session_token, presence:true
    validates :password, length: {minimum:6, allow_nil:true}
    validates :password_digest, presence: {message: 'Password can\'t be blank'}
    
    has_many :subs,
        primary_key: :id,
        foreign_key: :moderator_id,
        class_name: :Sub

    has_many :posts,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :Post

    has_many :comments,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :Comment
    
    before_validation :ensure_session_token

    def self.find_by_credentials(username,password)
        user = User.find_by(username: username)
        user.nil? ? nil : user.is_password?(password) ? user : nil
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom.urlsafe_base64(16)
        self.save!
        self.session_token 
    end

    private
    
    def ensure_session_token
        self.session_token ||= SecureRandom.urlsafe_base64(16)
    end

end
