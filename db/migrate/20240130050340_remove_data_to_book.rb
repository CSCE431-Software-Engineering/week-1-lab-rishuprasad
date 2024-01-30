class RemoveDataToBook < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :author
    remove_column :books, :price
    remove_column :books, :published_date

  end
end
