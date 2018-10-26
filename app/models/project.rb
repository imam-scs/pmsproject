class Project < ApplicationRecord
belongs_to :user,optional: true
 # has_many :users
 has_many :taskdetails
end
