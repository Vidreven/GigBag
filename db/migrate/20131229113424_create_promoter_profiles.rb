class CreatePromoterProfiles < ActiveRecord::Migration
  def change
    create_table :promoter_profiles do |t|
      t.string :identification
      t.string :phone_number
      t.string :street_address

      t.timestamps
    end
  end
end
