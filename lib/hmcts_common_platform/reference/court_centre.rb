# frozen_string_literal: true

require 'csv'

module HmctsCommonPlatform
  module Reference
    class CourtCentre
      include Queryable

      has_attributes :oucode, :oucode_l2_code, :oucode_l3_name

      def short_oucode
        oucode[0..4]
      end

      private


      def self.csv
        @csv ||= CSV.read(__dir__ + '/../../data/organisation_unit.csv', headers: true)
      end
    end
  end
end
