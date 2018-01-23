class Blockchain
  GENESIS_BLOCK_INDEX = 0

  attr_accessor :chain

  def initialize
    @chain = [first_block]
    @index = GENESIS_BLOCK_INDEX
  end

  def first_block
    Block.new(@index, 'genesis', 'genesis')
  end

  def next_block(data, previous_block_hash)
    @chain << Block.new(@index, data, previous_block_hash)
  end
end
