class User < ActiveRecord::Base
  validates :email, uniqueness: true
  validates_presence_of :name, :password_hash
  has_many :notes

  #or has_secure_password   -----> need password_digest

  def self.authenticate(args)
    user = User.find_by_email(args[:email])
    return user if user && user.password == args[:password]
    nil
  end

  def self.create(args)
    new_user = User.new(args)
    new_user.password = args[:password]
    new_user.save!
    new_user
  end

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(secret)
    @password = BCrypt::Password.create(secret)
    self.password_hash = @password
  end
end
