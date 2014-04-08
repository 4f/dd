class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :multi
      t.string :text

      t.timestamps
    end
  end
end
