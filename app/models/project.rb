class Project < ApplicationRecord
belongs_to :user, required: false
 # has_many :users
 has_many :taskdetails

 has_attached_file :image,styles:{large: "600*600>",medium: "300*300>",thumb: "150*150#"},default_url: "/images/:style/missing.png"

validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
