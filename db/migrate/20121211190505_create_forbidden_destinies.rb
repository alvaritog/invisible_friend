class CreateForbiddenDestinies < ActiveRecord::Migration
  def change
    create_table :forbidden_destinies do |t|
      t.integer :origin_id
      t.integer :destiny_id
    end
  end
end
