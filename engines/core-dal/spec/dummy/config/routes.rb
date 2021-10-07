# frozen_string_literal: true

Rails.application.routes.draw do
  mount Core::Dal::Engine => '/core-dal'
end
