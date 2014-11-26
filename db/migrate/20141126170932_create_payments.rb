class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :animal_id
      t.references :uid

      t.timestamps
    end
  end
end
