class AddAreaToAreas < ActiveRecord::Migration[7.1]
  def change
    create_table :areas do |t|
      t.string :area
      t.string :name
      t.string :surname
      t.string :patronymic
      t.string :telephone
      t.string :kadastr
      t.string :plot_area
      t.string :address_area
      t.boolean :member
      t.boolean :verificate
      t.belongs_to :user, null: false, foreign_key: true
      t.index :area, unique: true
      t.timestamps
    end




  end
end
