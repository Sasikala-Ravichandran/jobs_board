class RemoveCategoryIdFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :category_id
  end
end
