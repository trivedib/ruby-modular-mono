# frozen_string_literal: true

module Cim
  module Module
    # service class for CIM module that exposes all different service APIs
    class CimService
      class << self
        def create_customer(customer_entity)
          return unless customer_entity

          identity = customer_entity.identity
          address = customer_entity.address
          ApplicationRecord.transaction do
            identity_id = Cim::Dal::IdentityRepo.create(identity)
            address_id = Core::Dal::AddressRepo.create(address)
            Cim::Dal::CustomerAddressRepo.create(identity_id, address_id)
            identity_id
          end
        end

        def get_customer_address(customer_uuid)
          return unless customer_uuid

          identity = Cim::Dal::IdentityRepo.get_by_uuid(customer_uuid)
          return unless identity
          return unless identity.id

          address_id = Cim::Dal::CustomerAddressRepo.get_address_id(identity.id)
          Core::Dal::AddressRepo.get(address_id)
        end

        def get_customer_identity(customer_uuid)
          return unless customer_uuid

          Cim::Dal::IdentityRepo.get_by_uuid(customer_uuid)
        end
      end
    end
  end
end
