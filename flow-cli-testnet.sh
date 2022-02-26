#start testnet
flow project deploy --network testnet

#setup account
flow transactions send ./cadence/transactions/admin/setup_account.cdc --signer testnet-account --network=testnet

#check account setup state
flow scripts execute ./cadence/scripts/get_account_initialized.cdc --network=testnet "0x6085ae87e78e1433"

#create a set
flow transactions send ./cadence/transactions/admin/create_set.cdc --signer testnet-account --network=testnet "NextName Test" nil nil

#read the set data
flow scripts execute ./cadence/scripts/get_set_data.cdc --network=testnet 1

#create a collectible
flow transactions send ./cadence/transactions/admin/create_collectible_item.cdc --signer testnet-account --network=testnet "NextName Collectible Name" "This is a sample NextName Collectible." "https://image.shutterstock.com/image-vector/sample-stamp-grunge-texture-vector-260nw-1389188336.jpg" "<image/jpeg>" "https://nextname.niftory.com/" []

#add collectible to a set
flow transactions send ./cadence/transactions/admin/add_collectible_item_to_set.cdc --signer testnet-account --network=testnet 1 1

#mint a batch of NFTs
flow transactions send ./cadence/transactions/admin/mint_collectibles_bulk.cdc --signer testnet-account --network=testnet 1 1 200 "0x6085ae87e78e1433" --gas-limit 9999

