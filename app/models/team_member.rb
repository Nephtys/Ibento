class TeamMember < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  validates :auth_level, :user, :team, :presence => true
  validates_associated :user, :team
end
