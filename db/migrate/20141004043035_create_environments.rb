class CreateEnvironments < ActiveRecord::Migration
  def change
    create_table :environments do |t|
      t.float :target_e
      t.float :target_v
      t.float :target_d
      t.float :target_light
      t.float :target_sound
      t.float :current_sound

      t.timestamps
    end
  end
end
