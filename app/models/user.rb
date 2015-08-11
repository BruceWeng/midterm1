class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  has_many :comments

  def display_name
    self.email.split("@").first
  end
#test master
#test1
#test2
#test3
#test4
#test rebase 1
#test rebase 2
#test rebase 3
#test2-1
#test2-2
#test2-3
#test2 rebase 1
#test2 rebase 2
end
