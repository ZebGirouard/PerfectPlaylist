class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.float :energy
      t.float :valence
      t.float :danceability
      t.integer :rank

      t.timestamps
    end
  end
end
