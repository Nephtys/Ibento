class Note < ActiveRecord::Base
  belongs_to :event
  validates :title, :event, :presence => true
end
