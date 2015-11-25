class RemoveCategoryFromJobs < ActiveRecord::Migration
  def change
  	remove_foreign_key :jobs, :category
  end
end
