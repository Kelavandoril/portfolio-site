class DropContactMethods < ActiveRecord::Migration[8.1]
  def change
    drop_table :contact_methods
  end
end
