class CreateUserRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :user_roles do |t|
      t.references :users #:references :
      t.references :roles # :x

      t.timestamps
    end
  end
end
