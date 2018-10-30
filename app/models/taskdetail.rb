class Taskdetail < ApplicationRecord
belongs_to :project
# ,required: false
validates_presence_of :name,:message => 'You have to enter task name.'
validates :days,numericality: { only_integer: true }
validates_presence_of :status, :message => 'You have to enter Stauts of the task.'


end
