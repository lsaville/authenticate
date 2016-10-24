class User < ActiveRecord::Base
validates :full_name, presence: true
validates :email, presence: true, uniqueness: true
validates :password, presence: true

  def self.authenticate(email, password)
    @user.find_by(:email)
    if @user[:password] == password
      @user
    else
      nil
    end
  end
end
