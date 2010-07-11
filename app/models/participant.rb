class Participant < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  validates :user, :event, :status, :presence => true
end
