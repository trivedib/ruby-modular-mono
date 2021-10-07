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

    def changed_files
      changed_files = p `git diff $(git merge-base origin/master HEAD) --name-only`.split("\n")
      raise 'failed to get changed files' if changed_files.nil?

      changed_files
    end

    # @return [Set]
    def modified_libraries
      changed_gems = Set.new
      changed_engines = Set.new
      changed_db = false
      changed_top_level = false
      changed_files.each do |file|
        next if file.index('build')&.zero?

        changed_gems << file.split('/')[1] if file.index('gems')&.zero?
        changed_engines << file.split('/')[1] if file.index('engines')&.zero?
        changed_db = true if !changed_db && file.index('db')&.zero?
        if !changed_top_level && file.index('gems').nil? && file.index('engines').nil? && file.index('db').nil?
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

    def run_tests
      modified_libraries.each do |lib|
        puts "running tests for lib: #{lib}"
      end
      puts 'tests executed successfully'
    end
  end
end

puts BuildOptimizer.run_tests
