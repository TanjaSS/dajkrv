class AddLastDonationAtToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :last_donation_at, :date
  end
end
