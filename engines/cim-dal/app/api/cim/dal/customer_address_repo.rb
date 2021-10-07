# frozen_string_literal: true

module Cim
  module Dal
    # Repository object that provides CRUD and other DB operations on Customer Address domain model.
    class CustomerAddressRepo
      class << self
        # method to create a new identity instance into DB
        def create(customer_id, address_id)
          cust_address = Cim::Dal::CustomerAddress.create(customer_id: customer_id,
                                                          address_id: address_id)
          cust_address.id
        end

        # method to get address id
        def get_address_id(customer_id)
          return unless customer_id

          cust_address = Cim::Dal::CustomerAddress.find_by(customer_id: customer_id)
          return unless cust_address

          cust_address.address_id
        end
      end
    end
  end
end
