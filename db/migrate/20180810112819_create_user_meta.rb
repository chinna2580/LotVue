class CreateUserMeta < ActiveRecord::Migration[5.1]
  def change
    create_table :user_meta do |t|
      t.references :user
      t.text :meta_key
      t.text :meta_value

      t.timestamps
    end
  end
end
