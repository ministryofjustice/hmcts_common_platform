# frozen_string_literal: true

require 'csv'

module HmctsCommonPlatform
  module Reference
    class CourtCentre
      include Queryable

      has_attributes :oucode

      private


      def self.csv
        @csv ||= CSV.read(__dir__ + '/../../data/organisation_unit.csv', headers: true)
      end
    end
  end
end
