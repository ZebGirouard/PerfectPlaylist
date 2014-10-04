class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.integer :rank

      t.timestamps
    end
  end
end
