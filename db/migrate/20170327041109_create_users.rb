class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :login
      t.text :firstname
      t.text :lastname

      t.timestamps null: false
    end
  end
end
