require 'digest'

class Block
  attr_accessor :hash, :data, :previous_block_hash

  def initialize(index, data, previous_block_hash)
    @index = index
    @timestamp = Time.now.to_s
    @data = data
    @previous_block_hash = previous_block_hash
  end

  def hash
    @hash ||= Digest::SHA256.hexdigest(@index.to_s + @timestamp + @data.to_s + @previous_block_hash)
  end
end
