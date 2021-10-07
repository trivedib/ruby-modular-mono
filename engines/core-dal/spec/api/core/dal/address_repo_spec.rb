# frozen_string_literal: true

require 'rails_helper'
require 'securerandom'

module Core
  module Dal
    RSpec.describe 'address repo spec file' do
      it 'create address instance' do
        address_dto = Amount::Types::AddressDto.new(SecureRandom.uuid,
                                                    'address_1',
                                                    'address_2',
                                                    'Aurora',
                                                    'IL',
                                                    '60502')
        id = Core::Dal::AddressRepo.create(address_dto)
        raise_error unless id
        puts "address dto id: #{id}"
        expect(Core::Dal::AddressRepo.count).to eq(1)
      end
    end
  end
end
