class AddPhNameGenToUser < ActiveRecord::Migration[5.2]
  def self.up
  	 
  	 add_column :users, :phnumber, :string,limit: 10
  	 add_column :users, :gender, :string
  end

 def self.down
 	 remove_column :users, :phnumber
  	 remove_column :users, :gender
 end

end
