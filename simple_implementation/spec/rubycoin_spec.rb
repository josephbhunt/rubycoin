require_relative '../rubycoin.rb'

describe 'Block' do
  describe '#hash' do
    before do
      allow(Time).to receive(:now).and_return('2018-01-22 23:22:26 -0500')
    end

    it 'returns a hash of all the given data' do
      block = Block.new(0, 'hello', '0')
      expected_hash = "2ee80c6820673ac8ab5696983a3848e3843f78abc039a984d308e97571cdf02c"
      expect(block.hash).to eq(expected_hash)
    end
  end
end

describe 'Blockchain' do
  before do
    @blockchain = Blockchain.new
  end

  describe '#initialize' do
    it 'creates the genesys block' do
      expect(@blockchain.chain.count).to eq(1)
    end
  end

  describe '#next_block' do
    it 'creates a new block and adds it to the chain' do
      @blockchain.next_block('faux data')
      expect(@blockchain.chain.count).to eq(2)
    end

    it "has a reference to the previous block's hash" do
      last_block_hash = @blockchain.chain.last.hash
      @blockchain.next_block('faux data')
      expect(@blockchain.chain.last.previous_block_hash).to eq(last_block_hash)
    end
  end
end

describe 'Rubycoin' do
  describe '#simulate_transations' do
    it 'prints three transations' do
      Rubycoin.new.simulate_transations
    end
  end
end
