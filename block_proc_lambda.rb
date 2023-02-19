require 'zip'
require 'pathname'

# block it piece of code that can be passed to a method

module Zipper
  module Processor
    def open_and_process_zip(path)
      Zip::File.open_buffer(path) do |zip_file|
        fetch_zip_entries(zip_file) { |zip_entity| process(zip_entity) }
      end
    end

    def fetch_zip_entries(zip_file)
      return unless block_given?
       
      zip_file.each do |zip_entity|
        next unless proper_ext?(zip_entity.name)

        # each entity will be passed to the block { |zip_entity| process zip_entry } in line:10
        yield zip_entity
      end
    end

    def process(zip_entry)
        
    end

    private

    def proper_ext?(filename)
      '.txt' == Pathname.new(filename).extname
    end
  end
end