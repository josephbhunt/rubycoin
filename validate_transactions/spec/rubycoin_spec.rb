require 'spec_helper'
require_relative '../rubycoin'

describe 'Blockchain' do
  describe 'no_double_spend?' do
    before do
      @blockchain = Blockchain.new(Rubycoin::SOTOSHI_HASHED_KEY, Rubycoin::STARTING_AMOUNT)
    end

    it 'returns true when there is no double spend' do
      @blockchain.chain << Block.new(1, @blockchain.chain.first.hash, Rubycoin::ALICE_HASHED_KEY, Rubycoin::SOTOSHI_HASHED_KEY, 10)
      new_block =  Block.new(1, @blockchain.chain.first.hash, Rubycoin::BOB_HASHED_KEY, Rubycoin::ALICE_HASHED_KEY, 10)
      expect(@blockchain.no_double_spend?(new_block)).to be(true)
    end

    it 'returns false when there is a double spend' do
      @blockchain.chain << Block.new(1, @blockchain.chain.first.hash, Rubycoin::ALICE_HASHED_KEY, Rubycoin::SOTOSHI_HASHED_KEY, 10)
      @blockchain.chain << Block.new(1, @blockchain.chain.first.hash, Rubycoin::BOB_HASHED_KEY, Rubycoin::ALICE_HASHED_KEY, 10)
      new_block = Block.new(1, @blockchain.chain.first.hash, Rubycoin::JERRY_HASHED_KEY, Rubycoin::ALICE_HASHED_KEY, 10)
      expect(@blockchain.no_double_spend?(new_block)).to be(false)
    end
  end
end
