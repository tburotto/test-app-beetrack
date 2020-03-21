class CreateTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :tracks do |t|
      t.float :latitude
      t.float :longitude
      t.string :send_at
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
