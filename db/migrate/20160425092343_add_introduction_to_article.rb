class AddIntroductionToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :introduction, :text
  end
end
