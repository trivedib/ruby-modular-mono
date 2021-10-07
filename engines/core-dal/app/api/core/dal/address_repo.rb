# frozen_string_literal: true

module Core
  module Dal
    # Repository object that provides CRUD and other DB operations on Address domain model.
    class AddressRepo
      class << self
        # method to create a new address instance into DB
        def create(entity)
          identity = Core::Dal::Address.create(entity.to_json)
          # puts "no of identities: #{Cim::Dal::Identity.count}"
          identity.id
        end

        # method to update an existing address instance from DB.
        def update(entity)
          return unless entity
          return unless entity.id

          address = Core::Dal::Address.find(entity.id)
          return unless address

          address.update(entity.to_json)
          address.save!
          entity.id
        end

        # method to fetch address instance from DB
        def get(id)
          return unless id

          address = Core::Dal::Address.find(id)
          address_dto = Amount::Types::AddressDto.new(address.uuid,
                                                      address.address_1,
                                                      address.address_2,
                                                      address.city,
                                                      address.state,
                                                      address.zip)
          address_dto.id = id
          address_dto
        end

        # method to fetch address instance based on uuid
        def get_by_uuid(uuid)
          return unless uuid

          address = Core::Dal::Address.find_by(uuid: uuid)
          address_dto = Amount::Types::AddressDto.new(address.uuid,
                                                      address.address_1,
                                                      address.address_2,
                                                      address.city,
                                                      address.state,
                                                      address.zip)
          address_dto.id = address.id
          address_dto
        end

        # method to get count
        def count
          Core::Dal::Address.count
        end
      end
    end
  end
end
