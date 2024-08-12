class CreateVoteOptions < ActiveRecord::Migration[7.1]
  def change
    create_table :vote_options do |t|
      t.string :title
      t.references :poll, null: false, foreign_key: true

      t.timestamps
    end
  end
end
