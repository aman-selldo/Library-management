class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :role, null: false
      t.string :password_digest, null: false
      t.references :library, null: true, foreign_key: true

      t.timestamps
    end
  end
end
