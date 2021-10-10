class User < ApplicationRecord
    attr_reader :password  #add an attr_reader for password for the validation to occur!

    validates :user_name, :session_token, presence: true 
    validates :password_digest, presence: {message: "Password can\'t be blank"}
    validates :password, length:{minimum: 6, allow_nil: true}
    before_validation :ensure_session_token

    def self.find_by_credentials(user_name, password)
        user = User.find_by(user_name: user_name)
        return user if user && BCrypt::Password.new(user.password_digest).is_password?(password)
        nil 
    end

    def self.generate_session_token 
        SecureRandom::urlsafe_base64(16)
    end

    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def password= (password)
        @password = password 
        self.password_digest = BCrypt::Password.create(password)
    end
end

