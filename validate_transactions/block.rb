require 'digest'

class Block
  attr_accessor :hash, :previous_block_hash, :to_public_key, :from_public_key, :amount

  def initialize(index, previous_block_hash, to_public_key, from_public_key, amount)
    @index = index
    @timestamp = Time.now.to_s
    @previous_block_hash = previous_block_hash
    @to_public_key = to_public_key
    @from_public_key = from_public_key
    @amount = amount
  end

  def hash
    @hash ||= Digest::SHA256.hexdigest(@index.to_s + @timestamp + data + @previous_block_hash)
  end

  def data
    @to_public_key.to_s + @from_public_key.to_s + @amount.to_s
  end

  def print_block
    p "TO: #{@to_public_key}"
    p "FROM: #{@from_public_key}"
    p "AMOUNT: #{@amount}"
    p "Hash: #{@hash}"
    print "\n"
  end
end
