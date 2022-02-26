
import NextName from "../../contracts/NextName.cdc"

// This transaction is for retiring a collectible item from a set, which
// makes it so that collectibles can no longer be minted from that edition

// Parameters:
// 
// setID: the ID of the set in which a play is to be retired
// collectibleItemID: the ID of the collectible item to be retired

transaction(setID: UInt32, collectibleItemID: UInt32) {
    
    // local variable for storing the reference to the admin resource
    let adminRef: &NextName.Admin

    prepare(acct: AuthAccount) {

        // borrow a reference to the Admin resource in storage
        self.adminRef = acct.borrow<&NextName.Admin>(from: NextName.AdminStoragePath)
            ?? panic("No admin resource in storage")
    }

    execute {

        // borrow a reference to the specified set
        let setRef = self.adminRef.borrowSet(setID: setID)

        // retire the collectible item
        setRef.retireCollectibleItem(collectibleItemID: collectibleItemID)
    }

    post {
        
        NextName.SetData(setID: setID).retired[collectibleItemID]!: 
            "collectible item is not retired"
    }
}