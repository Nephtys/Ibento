class Event < ActiveRecord::Base
  validates :title, :presence => true
  has_many :teams, :dependent => :destroy
  has_many :notes, :dependent => :destroy
  has_many :task_lists, :dependent => :destroy
  has_many :participants, :dependent => :destroy
  has_many :organizers, :through => :teams, :source => :team_members
  belongs_to :geo_map, :dependent => :destroy
end
