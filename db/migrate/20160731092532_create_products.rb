class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 6, scale: 2
      t.references :category, foreign_key: true
      t.string :picture

      t.timestamps
    end

    add_index :products, :name
    add_index :products, :price

  end
end
