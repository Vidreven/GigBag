class AddUserIdToPromoterProfiles < ActiveRecord::Migration
  def change
  	add_column :promoter_profiles, :user_id, :integer
  end
end
