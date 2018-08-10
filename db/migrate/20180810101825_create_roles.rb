class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.text :role_name
      t.boolean :is_hidden, default: false

      t.timestamps
    end
  end
end
