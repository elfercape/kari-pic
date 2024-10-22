class CreateComentaries < ActiveRecord::Migration[7.2]
  def change
    create_table :comentaries do |t|
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.references :photos, null: false, foreign_key: true

      t.timestamps
    end
  end
end
