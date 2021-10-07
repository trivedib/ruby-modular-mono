# frozen_string_literal: true

require 'rails_helper'

module Cim
  module Dal
    RSpec.describe CustomerAddress, type: :model do
      it 'should create cust address' do
        create(:customer_address)
        expect(CustomerAddress.count).to eq(1)
      end
    end
  end
end
