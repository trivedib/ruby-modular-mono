# frozen_string_literal: true

class CreateCimDalCustomerAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :cim_dal_customer_addresses do |t|
      t.integer :customer_id
      t.integer :address_id

      t.timestamps
    end
  end
end
