class TaskList < ActiveRecord::Base
  has_many :tasks
  belongs_to :event
  belongs_to :team
  validates :title, :event, :presence => true
  validates_associated :event
end
