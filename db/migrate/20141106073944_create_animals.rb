class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.text :description
      t.string :photo

      t.timestamps
    end
  end
end
