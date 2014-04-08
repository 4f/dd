class TranslateAlbom < ActiveRecord::Migration
  def up
    Albom.create_translation_table!({
      text: :text, 
      title: :string,
      tumba: :string,
      }, {
        migrate_data: true
        })
  end

  def down
    Albom.drop_translation_table! migrate_data: true
  end
end
