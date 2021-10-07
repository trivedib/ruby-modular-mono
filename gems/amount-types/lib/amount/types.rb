# frozen_string_literal: true

require_relative "types/version"

module Amount
  module Types
    class Error < StandardError; end

    # address dto object
    class AddressDto
      def initialize(uuid, address_1, address_2, city, state, zip)
        @uuid = uuid
        @address1 = address_1
        @address2 = address_2
        @city = city
        @state = state
        @zip = zip
      end
      attr_accessor :id
      attr_reader :uuid, :address1, :address2, :city, :state, :zip

      def to_json(*_args)
        {
          "uuid" => uuid,
          "address_1" => address1,
          "address_2" => address2,
          "city" => city,
          "state" => state,
          "zip" => zip
        }
      end
    end

    # customer dto object
    class CustomerDto
      def initialize(identity, address)
        @identity = identity
        @address = address
      end
      attr_reader :identity, :address
    end

    # Identity DTO object
    class IdentityDto
      def initialize(uuid, status, legacy_customer_uuid)
        @uuid = uuid
        @status = status
        @legacy_customer_uuid = legacy_customer_uuid
      end

      attr_accessor :id
      attr_reader :uuid, :status, :legacy_customer_uuid
    end
  end
end
