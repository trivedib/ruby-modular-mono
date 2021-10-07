# frozen_string_literal: true

module Core
  module Dal
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
