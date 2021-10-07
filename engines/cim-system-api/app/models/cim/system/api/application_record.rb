# frozen_string_literal: true

module Cim
  module System
    module Api
      class ApplicationRecord < ActiveRecord::Base
        self.abstract_class = true
      end
    end
  end
end
