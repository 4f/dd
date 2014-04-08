class CreateHelpPages < ActiveRecord::Migration
  def change
    create_table :help_pages do |t|
      t.string :title
      t.text :text
      t.text :rek

      t.timestamps
    end
  end
end
