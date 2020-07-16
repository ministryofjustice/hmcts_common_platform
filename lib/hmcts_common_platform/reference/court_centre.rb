# frozen_string_literal: true

module HmctsCommonPlatform
  module Reference
    class CourtCentre
      include Queryable

      csv_attributes :id,
                     :oucode,
                     :oucode_l2_code,
                     :oucode_l3_name,
                     :region,
                     :oucode_l3_welsh_name,
                     :address1,
                     :address2,
                     :address3,
                     :address4,
                     :address5,
                     :postcode,
                     :lja

      def short_oucode
        oucode[0..4]
      end

      def self.csv
        @csv ||= CSV.read(__dir__ + '/../../data/organisation_unit.csv', headers: true)
      end
    end
  end
end
