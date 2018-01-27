require_relative '../proof_of_work'

describe 'ProofOfWork' do
  describe '#simulate_transactions' do
    it 'creates transactions using proof of work' do
      ProofOfWork.new.simulate_transactions
    end
  end
end


describe 'Block' do
  it 'creates transactions using proof of work' do
    @block = Block.new(0, 'genesis', 'genesis')
    hash_has_leading_zeros = @block.hash.slice(0..(Block::DIFFICULTY-1)) == Block::DIFFICULTY.times.map {|i| 0}.join
    expect(hash_has_leading_zeros).to be true
  end
end
