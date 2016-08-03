class AddProfileDescriptionToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :profile_description, :text
  end
end
