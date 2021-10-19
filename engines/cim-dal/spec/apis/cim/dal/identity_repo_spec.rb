# frozen_string_literal: true

require 'rails_helper'
require 'securerandom'

module Cim
  module Dal
    RSpec.describe 'Identity Repository spec file' do
      it 'create identity instance into db using repo' do
        identity_dto = ::Amount::Types::IdentityDto.new(SecureRandom.uuid, 'A', SecureRandom.uuid)
        id = Cim::Dal::IdentityRepo.create(identity_dto)
        puts "new identity id #{id}"
        raise_error unless id

        # connecting to CC DB
        puts "The number of payments are: #{::Cc::Payment.count}"
        puts ::Cc::Payment.last.to_json

        puts 'inserting a new record....'
        payment = ::Cc::Payment.new
        payment.account_id = ::Cc::Payment.last.account_id
        payment.strategy = ::Cc::Payment.last.strategy
        payment.date = ::Cc::Payment.last.date
        payment.status = ::Cc::Payment.last.status
        payment.origin = ::Cc::Payment.last.origin
        payment.scheduled_amount_cents = ::Cc::Payment.last.scheduled_amount_cents
        payment.payment_method = ::Cc::Payment.last.payment_method
        payment.save!
        puts payment.to_json
      end
    end
  end
end
