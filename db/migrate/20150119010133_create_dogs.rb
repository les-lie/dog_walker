class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.text :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
