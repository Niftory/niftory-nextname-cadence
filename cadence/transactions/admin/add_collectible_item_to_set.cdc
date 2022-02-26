import NextName from "../../contracts/NextName.cdc"

// This transaction is how a NextName admin adds a created Collectible Item to a Set

// Parameters:
//
// setID: the ID of the set to which a created Collectible Item is added
// collectibleItemID: the ID of the Collectible Item being added

transaction(setID: UInt32, collectibleItemID: UInt32) {

    // Local variable for the NextName Admin object
    let adminRef: &NextName.Admin

    prepare(acct: AuthAccount) {

        // borrow a reference to the Admin resource in storage
        self.adminRef = acct.borrow<&NextName.Admin>(from: NextName.AdminStoragePath)
            ?? panic("Could not borrow a reference to the Admin resource")
    }

    execute {
        
        // Borrow a reference to the set to be added to
        let setRef = self.adminRef.borrowSet(setID: setID)

        // Add the specified collectible item ID
        setRef.addCollectibleItem(collectibleItemID: collectibleItemID)
    }

    post {

        NextName.getCollectibleItemsInSet(setID: setID)!.contains(collectibleItemID): 
            "set does not contain collectibleItemID"
    }
}