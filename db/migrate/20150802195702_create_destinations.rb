class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :path

      t.timestamps
    end
  end
end
