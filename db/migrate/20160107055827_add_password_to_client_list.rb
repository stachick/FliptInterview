class AddPasswordToClientList < ActiveRecord::Migration
  def change
  	add_column :client_lists, :password, :string
  end
end
