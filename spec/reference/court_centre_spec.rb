# frozen_string_literal: true

RSpec.describe HmctsCommonPlatform::Reference::CourtCentre do
  let(:id) { '8e0f5ba6-50b6-3770-acfe-7aa1114eee46' }

  context '#find' do
    subject(:find) { described_class.find(id) }
    it 'returns the requested CourtCentre' do
      expect(find).to be_a(described_class)
    end

    it 'has requested attributes' do
      expect(find.oucode).to eq('A61AG00')
      expect(find.oucode_l2_code).to eq('61')
      expect(find.oucode_l3_name).to eq('Gwent RASSO')
      expect(find.region).to eq('Wales')
      expect(find).to respond_to(:id)
      expect(find).to respond_to(:oucode_l3_welsh_name)
      expect(find).to respond_to(:address1, :address2, :address3, :address4, :address5, :postcode)
      expect(find).to respond_to(:lja)
    end

    it 'responds to short_oucode' do
      expect(find.short_oucode).to eq('A61AG')
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
      expect(fetch_all.size).to eq(513)
    end
  end
end
