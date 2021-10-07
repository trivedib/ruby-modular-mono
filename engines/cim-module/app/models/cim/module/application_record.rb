# frozen_string_literal: true

module Cim
  module Module
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
