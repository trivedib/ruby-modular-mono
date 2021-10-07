# frozen_string_literal: true

class CreateCoreDalAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :core_dal_addresses do |t|
      t.uuid :uuid
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
