class Team < ActiveRecord::Base
  has_many :team_members, :dependent => :destroy
  validates :name, :presence => true
end
