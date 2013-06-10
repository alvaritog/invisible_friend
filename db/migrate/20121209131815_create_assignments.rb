class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :player_list
      t.integer :origin_id
      t.integer :destiny_id
    end
  end

end
