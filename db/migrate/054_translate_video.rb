class TranslateVideo < ActiveRecord::Migration
  def up
    Video.create_translation_table!({
      title: :string,
      }, {
        migrate_data: true
        })
  end

  def down
    Video.drop_translation_table! migrate_data: true
  end
end
