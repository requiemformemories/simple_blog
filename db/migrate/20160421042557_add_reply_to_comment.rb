class AddReplyToComment < ActiveRecord::Migration
  def change
    add_column :comments, :reply, :text
  end
end
