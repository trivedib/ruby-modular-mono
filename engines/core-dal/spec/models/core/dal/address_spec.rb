# frozen_string_literal: true

require 'rails_helper'

module Core
  # test file
  module Dal
    RSpec.describe Address, type: :model do
      it 'create address instance' do
        create(:address)
        expect(Core::Dal::Address.count).to eq(1)
      end
    end
  end
end
