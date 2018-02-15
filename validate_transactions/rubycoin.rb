load './block.rb'
load './blockchain.rb'

class Rubycoin

  STARTING_AMOUNT = 1000
  SOTOSHI_HASHED_KEY = "Sotoshi" # "2098fa6c652604729b6beae28a461ed70810fa3ebe72340b022464eb24074d48"
  BOB_HASHED_KEY = "Bob" # "81b637d8fcd2c6da6359e6963113a1170de795e4b725b84d1e0b4cfd9ec58ce9"
  ALICE_HASHED_KEY = "Alice" # "2bd806c97f0e00af1a1fc3328fa763a9269723c8db8fac4f93af71db186d6e90"
  JERRY_HASHED_KEY = "Jerry" # "3a5a2512949399115565867a73a413ec6ba215c8f2df385f78b33238a6639b7c"

  def initialize
    @blockchain = Blockchain.new(SOTOSHI_HASHED_KEY, STARTING_AMOUNT)
  end

  def simulate_transations
    @blockchain.next_block(ALICE_HASHED_KEY, SOTOSHI_HASHED_KEY, 10)
    @blockchain.next_block(BOB_HASHED_KEY, ALICE_HASHED_KEY, 5)
    @blockchain.next_block(JERRY_HASHED_KEY, ALICE_HASHED_KEY, 5)

    @blockchain.print_transactions
  end
end
