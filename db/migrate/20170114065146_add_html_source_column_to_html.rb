class AddHtmlSourceColumnToHtml < ActiveRecord::Migration[5.0]
  def change
    add_column :htmls, :html_source, :text
  end
end
