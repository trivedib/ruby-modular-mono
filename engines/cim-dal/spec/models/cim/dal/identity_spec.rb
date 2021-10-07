# frozen_string_literal: true

require 'rails_helper'

module Cim
  module Dal
    RSpec.describe Identity, type: :model do
      it 'should create identity' do
        create(:identity)
        expect(Identity.count).to eq(1)
      end
    end
  end
end
