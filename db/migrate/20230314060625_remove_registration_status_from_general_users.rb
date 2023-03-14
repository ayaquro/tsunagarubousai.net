class RemoveRegistrationStatusFromGeneralUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :general_users, :registration_status, :integer
  end
end
