class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.integer :userid
      t.integer :articleid

      t.timestamps
    end
  end
end
