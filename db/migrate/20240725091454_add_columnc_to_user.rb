class AddColumncToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :verificate, :boolean, default: false
    add_column :users, :role, :integer, default:0 ,null:false
    add_index :users, :role
  end
end
