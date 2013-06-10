class CreatePlayerLists < ActiveRecord::Migration
  def change
    create_table :player_lists do |t|
      t.references :user
      t.string :name

      t.timestamps
    end
  end
end
