import NextName from "../contracts/NextName.cdc"

// This script gets the Series associated with a Collectible
// in a collection by getting a reference to the Collectible
// and then looking up its series

// Parameters:
//
// account: The Flow Address of the account whose Collectible data needs to be read
// id: The unique ID for the Collectible whose data needs to be read

// Returns: NextName.Series
// The Series associated with a Collectible with a specified ID

pub fun main(account: Address, id: UInt64): NextName.Series {

    let collectionRef = getAccount(account).getCapability(NextName.CollectionPublicPath)
        .borrow<&{NextName.NextNameCollectionPublic}>()
        ?? panic("Could not get public NextName collection reference")

    let token = collectionRef.borrowCollectible(id: id)
        ?? panic("Could not borrow a reference to the specified Collectible")

    let data = token.data

    return NextName.SetData(setID: data.setID).series
}