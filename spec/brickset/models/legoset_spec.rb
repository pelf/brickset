require 'spec_helper'

describe Brickset::Legoset do
  let(:described_instance) { described_class.new legoset_id }
  let(:legoset_id) { '10251' }

  it 'initializes' do
    expect(described_instance).to be
  end

  describe '#url' do
    subject { described_instance.url }

    it 'returns a url' do
      expect(subject).to match /http.*brickset.*/
    end
  end
end
