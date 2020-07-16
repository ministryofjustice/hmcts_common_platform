# frozen_string_literal: true

require 'csv'

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
      def csv_attributes(*args)
        args.each do |arg|
          define_method(arg) do
            row[arg.to_s]
          end
        end
      end

      def find(id)
        csv_row = csv.find { |row| row['id'] == id }
        new(row: csv_row) unless csv_row.nil?
      end

      def all
        csv.map { |row| new(row: row) }
      end
    end

    private

    attr_reader :row
  end
end
