# rubycoin
Learning crypto with Ruby

# Variations
transactions
transactions with proof of work (POW)
Prevent malicious data from being added by checking the preveous hash. Hash of preveous block must match preveous_block_hash in new block.
transactions with proof of stake (POS)
transactions, POW, many nodes
transactions, POW, many nodes, with attacker
Actual transactions that verify signature and ability to pay by digging through preveous txn.
Validate no double spending.

# Blockchain VS Transaction Chain
Transaction chain keeps track of the ownership of coins.
Blockchain keeps track of the order of all transactions.

What happens when two blocks are generated at the same time? Simply chose the first block randomly and then decide wait for the next block. Always follow the longest chain.
