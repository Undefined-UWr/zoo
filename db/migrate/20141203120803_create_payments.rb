class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :animal_id
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
