require 'pp'
require 'pry'

class Blockchain
  GENESIS_BLOCK_INDEX = 0

  attr_accessor :chain

  def initialize(initial_hashed_key, initial_amount)
    @chain = [first_block(initial_hashed_key, initial_amount)]
    @index = GENESIS_BLOCK_INDEX
  end

  def first_block(hashed_key, amount)
    Block.new(0, 'genesis', hashed_key, 'nobody', amount)
  end

  def next_block(to_public_key, from_public_key, amount)
    new_block = Block.new(@index, previous_block_hash, to_public_key, from_public_key, amount)

    if no_double_spend?(new_block)
      @chain << new_block
    else
      p new_block.print_block
      raise 'Double spend error!'
    end
  end

  def no_double_spend?(block_to_check)
    amount_for_key = 0
    @chain.each do |b|
      if key_recieves_cash?(b, block_to_check)
        amount_for_key += b.amount
      elsif key_spends_cash?(b, block_to_check)
        amount_for_key -= b.amount
      end
    end
    enough_for_transaction?(amount_for_key, block_to_check)
  end

  def enough_for_transaction?(amount_for_key, new_block)
    (amount_for_key - new_block.amount) >= 0
  end

  def key_recieves_cash?(block_in_chain, new_block)
    block_in_chain.to_public_key == new_block.from_public_key
  end

  def key_spends_cash?(block_in_chain, new_block)
    block_in_chain.from_public_key == new_block.from_public_key
  end

  def previous_block_hash
    @chain.last.hash
  end

  def print_transactions
    @chain.each do |block|
      block.print_block
    end
  end
end
