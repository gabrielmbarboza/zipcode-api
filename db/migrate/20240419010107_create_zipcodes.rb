class CreateZipcodes < ActiveRecord::Migration[7.1]
  def change
    create_table :zipcodes do |t|
      t.string :code, null: false
      t.string :address
      t.string :neighborhood
      t.string :city
      t.string :uf
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
