class User < ActiveRecord::Base
  has_and_belongs_to_many :groups
  has_many :team_members
  has_many :teams , :through => :team_members
  validates :login, :email, :first_name, :last_name, :presence => true
  validates :login, :email, :uniqueness => true
  validates_format_of :email, :with => %r{^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$}i
end
