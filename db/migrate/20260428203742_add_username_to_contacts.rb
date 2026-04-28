class AddUsernameToContacts < ActiveRecord::Migration[8.1]
  def change
    add_column :contacts, :username, :string
  end
end
