class CreateClientLists < ActiveRecord::Migration
  def change
    create_table :client_lists do |t|
      t.string :client
      t.text :description

      t.timestamps
    end
  end
end
