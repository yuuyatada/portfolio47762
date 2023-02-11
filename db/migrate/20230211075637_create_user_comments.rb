class CreateUserComments < ActiveRecord::Migration[6.1]
  def change
    create_table :user_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
