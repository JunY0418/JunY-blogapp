class AddUserIdToArticle < ActiveRecord::Migration[7.0]
  def change
    add_reference :articles, :user
    # add_column :article, :user_id, :integer
  end
end
