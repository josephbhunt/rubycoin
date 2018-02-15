require 'pp'

class Blockchain
  GENESIS_BLOCK_INDEX = 0

  attr_accessor :chain

  def initialize
    @chain = [first_block]
    @index = GENESIS_BLOCK_INDEX
  end

  def first_block
    Block.new(0, 'genesis', 'genesis')
  end

  def next_block(data)
    @chain << Block.new(@index, data, previous_block_hash)
  end

  def previous_block_hash
    @chain.last.hash
  end

  def print_transactions
    print "\n"
    @chain.each do |block|
      pp "Data: #{block.data}, Hash: #{block.hash}"
    end
  end
end
