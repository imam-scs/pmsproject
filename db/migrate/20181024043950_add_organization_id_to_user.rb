class AddOrganizationIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :oraganization_id, :integer
 
    remove_column :organizations, :user_id
  end
end
