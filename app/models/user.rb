class User < ActiveRecord::Base
  include BCrypt
  # validations
  

  #TODO : Use bcrypt to store hashed passwords and authenticate users

  def self.authenticate(email, password)
    p email
    p password

    user = User.find_by_email(email)
      puts 'authenticated'

    if user && user.password == password
      return user
    else
      return nil
    end
  end

  def password
    @password ||= Password.new(self.password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password        
  end

end
