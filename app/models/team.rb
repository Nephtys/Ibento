class Team < ActiveRecord::Base
  belongs_to :event
  has_many :team_members, :dependent => :destroy
  validates :name, :presence => true
end
