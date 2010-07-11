class Event < ActiveRecord::Base
  validates :title, :presence => true
  has_many :teams, :dependent => :destroy
  has_many :notes, :dependent => :destroy
  has_many :task_lists, :dependent => :destroy
  has_many :participants
  has_many :organizers, :through => :teams, :source => :team_members
end
