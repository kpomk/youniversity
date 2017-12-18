sclass CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :belonging
      t.string :major
      t.text :publication

      t.timestamps
    end
  
end
