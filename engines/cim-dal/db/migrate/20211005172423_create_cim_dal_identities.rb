# frozen_string_literal: true

class CreateCimDalIdentities < ActiveRecord::Migration[6.1]
  def change
    create_table :cim_dal_identities do |t|
      t.uuid :uuid
      t.string :status
      t.uuid :legacy_customer_uuid

      t.timestamps
    end
  end
end
