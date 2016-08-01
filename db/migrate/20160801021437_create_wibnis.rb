class CreateWibnis < ActiveRecord::Migration[5.0]
  def change
    create_table :wibnis do |t|
      t.string :title
      t.text :summary
      t.text :description
      t.text :looking_for
      t.string :picture
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_index :wibnis, :title
  end
end
