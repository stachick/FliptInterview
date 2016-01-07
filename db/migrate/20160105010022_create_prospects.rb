class CreateProspects < ActiveRecord::Migration
  def change
    create_table :prospects do |t|
      t.references :client_list, index: true
      t.string :name
      t.string :phone

      t.timestamps
    end
  end
end
