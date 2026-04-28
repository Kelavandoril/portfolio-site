class AddServiceNameToContacts < ActiveRecord::Migration[8.1]
  def change
    add_column :contacts, :service_name, :string
  end
end
