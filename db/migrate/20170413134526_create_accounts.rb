class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :uid,                null: false
      t.string :provider,           null:false

      t.timestamps
    end
  end
end
