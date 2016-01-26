class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :username

      t.timestamps null: false
    end

    add_index :customers, :email, unique: true
    add_index :customers, :username, unique: true
  end
end
