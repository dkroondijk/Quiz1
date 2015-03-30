class UpdateCompleteDatatype < ActiveRecord::Migration
  def change
    add_column :requests, :done, :integer
  end
end
