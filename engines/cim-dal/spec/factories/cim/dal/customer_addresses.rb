# frozen_string_literal: true

FactoryBot.define do
  factory :customer_address, class: 'Cim::Dal::CustomerAddress' do
    customer_id { 1 }
    address_id { 1 }
  end
end
