# frozen_string_literal: true

Rails.application.routes.draw do
  mount Cim::Dal::Engine => '/cim-dal'
end
