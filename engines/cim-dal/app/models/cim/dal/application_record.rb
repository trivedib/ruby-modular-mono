# frozen_string_literal: true

module Cim
  module Dal
    # base class for all the active record models
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
