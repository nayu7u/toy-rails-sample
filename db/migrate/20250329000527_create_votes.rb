class CreateVotes < ActiveRecord::Migration[8.0]
  def change
    create_table :votes do |t|
      t.string :name
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
