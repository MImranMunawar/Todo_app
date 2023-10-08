class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest
      t.string :username
      t.date   :date_of_birth
      t.string :phone_number
      t.timestamps
    end
  end
end
