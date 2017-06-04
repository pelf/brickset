require 'spec_helper'

describe Brickset::Client do
  let(:described_instance) { described_class.new }
  let(:legoset_id) { '10251' }

  it 'initializes' do
    expect(described_instance).to be
  end

  describe '#get_set' do
    subject { described_instance.get_set legoset_id }

    it 'calls the correct service' do
      expect(Brickset::Services::GetLegoset).to receive(:new).and_call_original.with(legoset_id)
      expect_any_instance_of(Brickset::Services::GetLegoset).to receive(:run)
      subject
    end
  end
end
