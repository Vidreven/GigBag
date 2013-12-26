class ChangeEventStatusToDefault < ActiveRecord::Migration
  def change
  	change_column :events, :status, :string, default: "Discussion"
  end
end
