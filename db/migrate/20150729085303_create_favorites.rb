class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :favoritable_id, null: false
      t.string :favoritable_type, null: false

      t.timestamps null: false
    end

    add_index :favorites, [:user_id, :favoritable_id, :favoritable_type], \
      unique: true, \
      name: 'index_favorites_on_user_id_and_favoritable'
  end
end
