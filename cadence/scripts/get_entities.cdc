import NextName from "../contracts/NextName.cdc"

// This is the script to get a list of all the NFTs an account owns
// Just change the argument to `getAccount` to whatever account you want
// and as long as they have a published Collection receiver, you can see
// the Collectibles they own.

// Parameters:
//
// account: The Flow Address of the account whose Collectible data needs to be read

// Returns: [NextName.NFT]
// list of all NFTs an account owns

pub struct CollectibleReturn {
    pub var data : NextName.CollectibleData
    pub var id : UInt64

    init(data: NextName.CollectibleData, id: UInt64) {
        self.data = data;
        self.id = id;
    }
}

pub fun main(account: Address, collectibleID: UInt32): [CollectibleReturn] {

    let acct = getAccount(account)

    let collectionRef = acct.getCapability(NextName.CollectionPublicPath)
        .borrow<&{NextName.NextNameCollectionPublic}>()!

    var entities: [CollectibleReturn] = []

    for id in collectionRef.getIDs() {

        
        let token = collectionRef.borrowCollectible(id: id)
        ?? panic("Could not borrow a reference to the specified Collectible")

        let data = token.data

        if (collectibleID == data.collectibleItemID){
            let toAppend = CollectibleReturn(data: data, id: token.id)
            entities.append(toAppend)
        }
    }

    return entities
}