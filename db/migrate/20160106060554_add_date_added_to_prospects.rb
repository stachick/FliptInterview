class AddDateAddedToProspects < ActiveRecord::Migration
  def change
  	add_column :prospects, :added_at, :datetime
  end
end
