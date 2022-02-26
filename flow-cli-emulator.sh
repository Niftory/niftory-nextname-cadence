#start emulator
flow project deploy --network emulator

#setup account
flow transactions send ./cadence/transactions/admin/setup_account.cdc --signer emulator-account --network=emulator

#check account setup state
flow scripts execute ./cadence/scripts/get_account_initialized.cdc --network=emulator "0xf8d6e0586b0a20c7"

#create a set
flow transactions send ./cadence/transactions/admin/create_set.cdc --signer emulator-account --network=emulator "NextName Test" nil nil

#read the set data
flow scripts execute ./cadence/scripts/get_set_data.cdc --network=emulator 1

#create a collectible
flow transactions send ./cadence/transactions/admin/create_collectible_item.cdc --signer emulator-account --network=emulator "NextName Collectible Name" "This is a sample NextName Collectible." "https://image.shutterstock.com/image-vector/sample-stamp-grunge-texture-vector-260nw-1389188336.jpg" "<image/jpeg>" "https://nextname.niftory.com/" []

#add collectible to a set
flow transactions send ./cadence/transactions/admin/add_collectible_item_to_set.cdc --signer emulator-account --network=emulator 1 1

#mint a batch of NFTs
flow transactions send ./cadence/transactions/admin/mint_collectibles_bulk.cdc --signer emulator-account --network=emulator 1 1 200 "0xf8d6e0586b0a20c7" --gas-limit 9999

