class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :userid
      t.float :latitude
      t.float :longitude
      t.string :title
      t.text :description
      t.string :address
      t.timestamps
    end
  end
end
