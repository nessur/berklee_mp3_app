class CreateMp3s < ActiveRecord::Migration
  def self.up
    create_table :mp3s do |t|
      t.string :url
      t.string :title
      t.string :artist_name
      t.integer :length

      t.timestamps
    end
  end

  def self.down
    drop_table :mp3s
  end
end
