class CreateOrganizations < ActiveRecord::Migration[6.0]
    def change
        create_table :organizations do |t|
            t.string :name
            t.integer :annual_sales_value
            t.string :industry_type
        end
        add_reference :users, :organization, index: true
    end
end
