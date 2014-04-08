class TranslateMember < ActiveRecord::Migration
  def up
    Member.create_translation_table!({
      remark: :string,
      city: :string,
      name: :string,
      }, {
        migrate_data: true
        })
  end

  def down
    Member.drop_translation_table! migrate_data: true
  end
end
