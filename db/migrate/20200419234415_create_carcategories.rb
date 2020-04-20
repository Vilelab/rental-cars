class CreateCarcategories < ActiveRecord::Migration[6.0]
  def change
    create_table :carcategories do |t|
      t.string :name
      t.float :daily_rate
      t.float :car_insurance
      t.float :third_party_insurance

      t.timestamps
    end
  end
end
