class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :lastName
      t.string :docId
      t.string :phone
      t.string :address
      t.integer :admin, default: 0

      t.timestamps
    end
  end
end
