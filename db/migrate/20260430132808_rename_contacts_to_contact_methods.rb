class RenameContactsToContactMethods < ActiveRecord::Migration[8.1]
  def change
    rename_table :contacts, :contact_methods
  end
end
