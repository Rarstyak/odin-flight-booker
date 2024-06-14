class CreateAirports < ActiveRecord::Migration[7.1]
  def change
    create_table :airports do |t|
      t.string :city
      t.string :country
      t.string :continent
      t.string :code

      t.timestamps
    end
  end
end
