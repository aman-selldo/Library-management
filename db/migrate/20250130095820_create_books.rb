class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.references :category, foreign_key: true
      t.references :author,  foreign_key: true
      t.integer :published_year

      t.timestamps
    end

    add_index :books, [:title, :author_id], unique: true
  end
end