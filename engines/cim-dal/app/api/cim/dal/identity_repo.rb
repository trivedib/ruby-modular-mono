# frozen_string_literal: true

module Cim
  module Dal
    # Repository object that provides CRUD and other DB operations on Identity domain model.
    class IdentityRepo
      class << self
        # method to create a new identity instance into DB
        def create(entity)
          identity = Cim::Dal::Identity.create(uuid: entity.uuid,
                                               status: entity.status,
                                               legacy_customer_uuid: entity.legacy_customer_uuid)
          identity.id
        end

        # method to update an existing identity instance from DB.
        def update(id, entity)
          return unless id

          identity = Cim::Dal::Identity.find(id)
          return unless identity

          identity.update(uuid: entity.uuid,
                          status: entity.status,
                          legacy_customer_uuid: entity.legacy_customer_uuid)
          identity.save!
          id
        end

        # method to fetch identity instance from DB
        def get(id)
          return unless id

          identity = Cim::Dal::Identity.find(id)
          Amount::Types::IdentityDto.new(identity.uuid, identity.status, identity.legacy_customer_uuid)
        end

        # method to fetch identity instance based on uuid
        def get_by_uuid(uuid)
          return unless uuid

          identity = Cim::Dal::Identity.find_by(uuid: uuid)
          identity_dto = Amount::Types::IdentityDto.new(identity.uuid, identity.status, identity.legacy_customer_uuid)
          identity_dto.id = identity.id
          identity_dto
        end

        # method to fetch identity instance based on legacy uuid
        def get_by_legacy_uuid(uuid)
          return unless uuid

          identity = Cim::Dal::Identity.find_by(legacy_customer_uuid: uuid)
          Amount::Types::IdentityDto.new(identity.uuid, identity.status, identity.legacy_customer_uuid)
        end

        # method to get count
        def count
          Cim::Dal::Identity.count
        end
      end
    end
  end
end
