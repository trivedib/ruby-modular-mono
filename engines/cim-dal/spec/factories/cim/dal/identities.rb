# frozen_string_literal: true

FactoryBot.define do
  factory :identity, class: 'Cim::Dal::Identity' do
    uuid { '16c5beee-260d-11ec-9621-0242ac130002' }
    status { 'A' }
    legacy_customer_uuid { '1dd1f1ee-260d-11ec-9621-0242ac130002' }
  end
end
