class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.attachment :foto
      t.string :name
      t.string :remark

      t.timestamps
    end
  end
end
