class AddTwoFactorUtilsToUsers < ActiveRecord::Migration[5.2]
  def self.up
    add_column :users, :unconfirmed_otp_secret, :string
  end
  def self.down
   remove_column :users, :unconfirmed_otp_secret
  end
end
