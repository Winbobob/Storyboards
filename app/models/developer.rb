class Developer < ActiveRecord::Base
  belongs_to :project
  belongs_to :story
  validates :name, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true
  validates :project, :presence => true
  validates :story, :presence => false
  
  class << self
    def authenticate(name, password)
      if developer = find_by_name(name)
        if developer.password == password
          developer
        end
      end
    end
  end
end
