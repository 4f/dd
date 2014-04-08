class TranslateContact < ActiveRecord::Migration
  def up
    Contact.create_translation_table!({
      text: :text, 
      }, {
        migrate_data: true
        })
  end

  def down
    Contact.drop_translation_table! migrate_data: true
  end
end
