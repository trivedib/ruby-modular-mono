# frozen_string_literal: true

Rails.application.routes.draw do
  mount Cim::Module::Engine => '/cim-module'
end
