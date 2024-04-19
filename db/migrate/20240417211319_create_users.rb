class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: { unique: true, name: 'unique_user_email' }
      t.string :password, null: false

      t.timestamps
    end
  end
end
