require 'set'

class BuildOptimizer
  class << self
    def libraries
      all_items = Set.new
      all_items <<  'core-dal'
      all_items <<  'cim-dal'
      all_items <<  'cim-module'
      all_items <<  'cim-system-api'
      all_items << 'amount-types'
      all_items
    end

    def engines
      all_items = Set.new
      all_items <<  'core-dal'
      all_items <<  'cim-dal'
      all_items <<  'cim-module'
      all_items <<  'cim-system-api'
      all_items
    end

    # @return [Set]
    def dirty_libraries
      changed_files = p `git diff $(git merge-base origin/master HEAD) --name-only`.split("\n")
      raise 'failed to get changed files' if changed_files.nil?

      changed_gems = Set.new
      changed_engines = Set.new
      changed_db = false
      changed_top_level = false
      changed_files.each do |file|
        case file
        when %r{^gems/(\w+)}
          changed_gems << Regexp.last_match[1]
        when %r{^engines/(\w+)}
          changed_engines << Regexp.last_match[1]
        when %r{^db/}
          changed_db = true
        when %r{^scripts/} # rubocop:disable Lint/EmptyWhen
          # scripts do not affect the build
        else
          changed_top_level = true
        end
      end

      if changed_top_level
        # something outside of gems/ engines/ and db/ changed, consider everything dirty
        libraries
      elsif changed_db
        # database changed, run all engines
        changed_gems + engines
      else
        changed_gems + changed_engines
      end
    end
  end
end

puts BuildOptimizer.dirty_libraries
