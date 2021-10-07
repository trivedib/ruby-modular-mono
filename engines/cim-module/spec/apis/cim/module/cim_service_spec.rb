# frozen_string_literal: true

require 'rails_helper'
require 'securerandom'

module Cim
  module Module
    RSpec.describe 'cim service spec' do
      it 'create customer with identity and address' do
        identity_uuid = SecureRandom.uuid
        identity = Amount::Types::IdentityDto.new(identity_uuid, 'A', identity_uuid)
        address = Amount::Types::AddressDto.new(identity_uuid, 'a1', 'a2', 'c', 'IL', '60010')
        customer = Amount::Types::CustomerDto.new(identity, address)
        customer_id = Cim::Module::CimService.create_customer(customer)
        raise_error unless customer_id

        stored_identity = Cim::Module::CimService.get_customer_identity(identity_uuid)
        raise_error unless stored_identity
        expect(stored_identity.status).to eq(identity.status)
        expect(stored_identity.uuid).to eq(identity.uuid)

        stored_address = Cim::Module::CimService.get_customer_address(identity_uuid)
        raise_error unless stored_address
        expect(stored_address.city).to eq(address.city)
        expect(stored_address.zip).to eq(address.zip)
      end
    end
  end
end
