class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.references :company, index: true, foreign_key: true
      t.string :first_name, null: false
      t.string :last_name, null: false

      t.timestamps null: false
    end
  end
end
