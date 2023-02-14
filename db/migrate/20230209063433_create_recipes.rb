class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.integer :comment_id
      t.integer :breed_id
      t.text :title
      t.text :main_text
      t.boolean "is_active", default: true, null: false
      t.timestamps
    end
  end
end
