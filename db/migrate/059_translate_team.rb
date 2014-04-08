class TranslateTeam < ActiveRecord::Migration
  def up
    Team.create_translation_table!({
      remark: :string,
      name: :string,
      }, {
        migrate_data: true
        })
  end

  def down
    Team.drop_translation_table! migrate_data: true
  end
end
