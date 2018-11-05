class AddDaysToTaskdetail < ActiveRecord::Migration[5.2]
  def change
    add_column :taskdetails, :days, :integer
    add_column :taskdetails, :status, :string

    
  end
end
