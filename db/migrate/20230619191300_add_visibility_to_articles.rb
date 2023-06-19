class AddVisibilityToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :visible, :boolean
  end
end
