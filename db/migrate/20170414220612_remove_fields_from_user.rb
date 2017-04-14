class RemoveFieldsFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :uid, :string
    remove_column :users, :provider, :string
    remove_column :users, :image, :string
  end
end
