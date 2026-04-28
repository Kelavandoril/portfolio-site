class AddResourceLinkToContacts < ActiveRecord::Migration[8.1]
  def change
    add_column :contacts, :link_url, :string
  end
end
