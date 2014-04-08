class AddColumnFotoToVideo < ActiveRecord::Migration
  def self.up
    change_table :videos do |t|
      t.attachment :foto
    end
  end

  def self.down
    drop_attached_file :videos, :foto
  end
end
