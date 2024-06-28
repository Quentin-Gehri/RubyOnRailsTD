class CreateReparations < ActiveRecord::Migration[7.1]
  def change
    create_table :reparations do |t|
      t.string :appareil
      t.text :description
      t.date :date_depot
      t.string :statut
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
