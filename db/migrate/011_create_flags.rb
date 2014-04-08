class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.attachment :image
      t.string :country

      t.timestamps
    end
  end
end
