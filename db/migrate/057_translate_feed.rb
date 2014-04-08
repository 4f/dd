class TranslateFeed < ActiveRecord::Migration
  def up
    News::Feed.create_translation_table!({
      text: :text, 
      preambula: :text, 
      author: :string,
      title: :string,
      }, {
        migrate_data: true
        })
  end

  def down
    News::Feed.drop_translation_table! migrate_data: true
  end
end
