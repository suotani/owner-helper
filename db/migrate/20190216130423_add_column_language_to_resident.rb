class AddColumnLanguageToResident < ActiveRecord::Migration[5.2]
  def change
    add_column :residents, :language, :string
    add_column :owners, :language, :string, default: "ja"
    add_column :contact_chats, :other_language_text, :text
  end
end
