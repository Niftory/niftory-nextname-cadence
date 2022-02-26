import NonFungibleToken from "../../contracts/NonFungibleToken.cdc"
import NextName from "../../contracts/NextName.cdc"

// This transaction sets up an account to collect NextName Collectibles
// by storing an empty NextName collectible collection and creating
// a public capability for it

transaction {

    prepare(acct: AuthAccount) {

        // First, check to see if a NextName collectible collection already exists
        if acct.borrow<&NextName.Collection>(from: NextName.CollectionStoragePath) == nil {

            // create a new NextName Collection
            let collection <- NextName.createEmptyCollection() as! @NextName.Collection

            // Put the new Collection in storage
            acct.save(<-collection, to: NextName.CollectionStoragePath)

            // create a public capability for the collection
            acct.link<&{NextName.NextNameCollectionPublic}>(NextName.CollectionPublicPath, target: NextName.CollectionStoragePath)

        }
    }
}