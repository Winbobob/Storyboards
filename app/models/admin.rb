class Admin < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true
  class << self
    def authenticate(name, password)
      if admin = find_by_name(name)
        if admin.password == password
          admin
        end
      end
    end
  end
end
