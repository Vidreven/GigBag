class AddPromoterProfileIdToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :promoter_profile_id, :integer
  end
end
