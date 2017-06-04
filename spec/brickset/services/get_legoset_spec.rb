require 'spec_helper'

describe Brickset::Services::GetLegoset do
  use_vcr_cassette "get_legoset"

  let(:described_instance) { described_class.new legoset_id }
  let(:legoset_id) { '10251' }

  it 'initializes' do
    expect(described_instance).to be
  end

  describe '#run' do
    subject { described_instance.run }

    it 'returns a set with details' do
      expect(subject).to be

      [:name, :theme, :subtheme, :year, :pieces, :minifigs, :rrpp, :rrpd, :rrp, :ppp, :score, :available_since, :eol].each do |attr|
        expect(subject.send(attr)).to be_present
      end
    end
  end
end
