# frozen_string_literal: true

module Cc
  # base class for all the active record models
  class CCApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
    connects_to database: { writing: :cc_db, reading: :cc_db }
  end
end

