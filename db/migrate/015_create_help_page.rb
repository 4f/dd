class CreateHelpPage < ActiveRecord::Migration
  def change
    create_table :help_page do |t|
      t.string :title
      t.text :text
      t.text :req
      t.timestamps
    end
  end
end
