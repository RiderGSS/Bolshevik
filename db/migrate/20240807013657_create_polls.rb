class CreatePolls < ActiveRecord::Migration[7.1]
  def change
    create_table :polls do |t|
      t.text :topic

      t.timestamps
    end
  end
end
