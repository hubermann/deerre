class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :name
      t.integer :gender
      t.integer :languaje
      t.string :location
      t.string :city
      t.string :bio
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
