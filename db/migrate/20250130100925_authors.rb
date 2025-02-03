class Authors < ActiveRecord::Migration[8.0]
  def change
    create_table :authors do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.text :bio

      t.timestamps
    end

    add_index :authors, [:first_name, :last_name], unique: true
  end
end