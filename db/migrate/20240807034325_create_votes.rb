class CreateVotes < ActiveRecord::Migration[7.1]
  def change
    create_table :votes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :vote_option, null: false, foreign_key: true
      t.timestamps
    end
    add_index :votes, [:vote_option_id, :user_id], unique: true
  end
end
