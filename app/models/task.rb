class Task < ActiveRecord::Base
  belongs_to :task_list
  validates :title, :task_list, :presence => true
end
