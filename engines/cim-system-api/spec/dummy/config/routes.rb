# frozen_string_literal: true

Rails.application.routes.draw do
  mount Cim::System::Api::Engine => '/cim-system-api'
end
