class AddNumvotesToWibnis < ActiveRecord::Migration[5.0]
  def change
    add_column :wibnis, :numvotes, :string
  end
end
