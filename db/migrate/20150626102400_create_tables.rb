class CreateTables < ActiveRecord::Migration
  def change
    create_table :moods do |t|
      t.references :location
      t.integer :score
      t.integer :happy_words
      t.integer :sad_words

      t.timestamps
    end

    create_table :locations do |t|
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
