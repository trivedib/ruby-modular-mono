# frozen_string_literal: true

FactoryBot.define do
  factory :address, class: 'Core::Dal::Address' do
    uuid { 'test' }
    address_1 { 'MyString' }
    address_2 { 'MyString' }
    city { 'MyString' }
    state { 'MyString' }
    zip { 'MyString' }
  end
end
