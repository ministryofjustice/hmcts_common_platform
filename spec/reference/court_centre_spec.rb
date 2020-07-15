# frozen_string_literal: true

RSpec.describe HmctsCommonPlatform::Reference::CourtCentre do

  let(:id) { 'a2ff05a1-1f2f-31d4-8854-a5f39f1c1478' }

  context '#find' do
    subject(:find) { described_class.find(id) }
    it 'returns the requested CourtCentre' do
      expect(find).to be_a(described_class)
      expect(find.oucode).to eq('A88AE00')
      expect(find.oucode_l2_code).to eq('88')
      expect(find.oucode_l3_name).to eq('SFD London')
    end

    it 'responds to short_oucode' do
      expect(find.short_oucode).to eq('A88AE')
    end

    context 'when the CourtCentre does not exist' do
      let(:id) { 'XYZ' }

      it { is_expected.to be_nil }
    end
  end

  context '#all' do
    subject(:fetch_all) { described_class.all }
    it 'returns all CourtCentres' do
      expect(fetch_all).to all be_a(described_class)
      expect(fetch_all.size).to eq(506)
    end
  end
end
