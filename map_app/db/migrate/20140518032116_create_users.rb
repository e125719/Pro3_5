class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :userid
      t.decimal :latitude, :precision => 10, :scale => 7 
      #t.float :latitude
      t.decimal :longitude, :precision => 10, :scale => 7 
      #t.float :longitude
      t.string :title
      t.text :description
      t.string :address
      t.timestamps
    end
  end
end
