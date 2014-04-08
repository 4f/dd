class TranslateHome < ActiveRecord::Migration
  def up
    Home.create_translation_table!({
      preText: :text, 
      postText: :text, 
      title: :string,
      title2: :string,
      announcement: :string,
      }, {
        migrate_data: true
        })
  end

  def down
    Home.drop_translation_table! migrate_data: true
  end
end
