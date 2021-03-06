require 'spec_helper'

describe Brickset::Services::GetLegoset do
  let(:described_instance) { described_class.new legoset_id }
  let(:legoset_id) { '10251' }

  it 'initializes' do
    expect(described_instance).to be
  end

  describe '#run', vcr: { cassette_name: 'get_legoset' } do
    subject { described_instance.run }

    it 'returns a set with details' do
      expect(subject).to be
      [:name, :theme, :subtheme, :year, :pieces, :minifigs, :rrp_gbp, :rrp_usd, :rrp_eur, :ppp, :score, :available_since, :eol].each do |attr|
        expect(subject.send(attr)).to be_present
      end
    end

    context 'for an inexistent set', vcr: { cassette_name: 'not_found' } do
      let(:legoset_id) { '123456' }

      it 'raises a not found exception' do
        expect { subject }.to raise_error(Brickset::Legoset::NotFound)
      end
    end
  end
end
