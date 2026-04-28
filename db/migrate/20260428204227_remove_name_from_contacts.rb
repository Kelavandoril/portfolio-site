class RemoveNameFromContacts < ActiveRecord::Migration[8.1]
  def change
    remove_column :contacts, :name, :string
  end
end
