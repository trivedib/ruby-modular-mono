# frozen_string_literal: true

require 'rails_helper'
require 'securerandom'

module Cim
  module Dal
    RSpec.describe 'Identity Repository spec file' do
      it 'create identity instance into db using repo' do
        identity_dto = Amount::Types::IdentityDto.new(SecureRandom.uuid, 'A', SecureRandom.uuid)
        id = Cim::Dal::IdentityRepo.create(identity_dto)
        puts "new identity id #{id}"
        raise_error unless id
      end
    end
  end
end
