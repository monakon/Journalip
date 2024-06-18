class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.string :title, null: false
      t.text :opinion, null: false
      t.text :background, null: false
      t.string :emotion, null: false
      t.text :value, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
