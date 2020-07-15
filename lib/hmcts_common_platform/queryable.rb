# frozen_string_literal: true

module HmctsCommonPlatform
  module Queryable
    def self.included(base)
      base.extend ClassMethods
      base.prepend Initializer
    end

    module Initializer
      def initialize(row:)
        @row = row
      end
    end

    module ClassMethods

      def has_attributes(*args)
        args.each do |arg|
          define_method(arg) {
            row[arg.to_s]
          }
        end
      end

      def find(id)
        row = csv.find { |row| row['id'] == id }
        new(row: row) unless row.nil?
      end

      def all
        csv.map { |row| new(row: row)  }
      end
    end

    private

    attr_reader :row
  end
end
