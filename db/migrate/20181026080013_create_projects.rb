class CreateProjects < ActiveRecord::Migration[5.2]
   def self.up
  
    create_table :projects do |t|
      t.string :prjname
      t.string :prjtype
      t.integer :team_members
      t.string :client_name
      t.string :technology

      t.timestamps
 
  end
end
end
