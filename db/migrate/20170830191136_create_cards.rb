class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :image
      t.string :name
      t.string :role
      t.string :city
      t.string :school

      t.references :quiz, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
