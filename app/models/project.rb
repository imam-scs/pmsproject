class Project < ApplicationRecord
belongs_to :user, required: false
 # has_many :users
 has_many :taskdetails

 has_attached_file :image,styles:{large: "600*600>",medium: "300*300>",thumb: "150*150#"},default_url: "/images/:style/missing.png"

validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
validates_format_of :prjname, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/,:message => "You have to enter your project name."
validates_presence_of   :prjtype, :message => "You have to enter your project type."
validates_presence_of   :technology, :message => "You have to enter your technology."
validates_presence_of   :client_name, :message => "You have to enter client name in this field"
# validates_numericality_of   :team_members  ,:only_integer => true ,    :allow_nil => true  , :message => "You have to enter numbers only"
                              
                           
end
