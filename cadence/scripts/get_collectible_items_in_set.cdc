import NextName from "../contracts/NextName.cdc"

// This script returns an array of the Collectible Item IDs that are
// in the specified set

// Parameters:
//
// setID: The unique ID for the set whose data needs to be read

// Returns: [UInt32]
// Array of Collectible Item IDs in specified set

pub fun main(setID: UInt32): [UInt32] {

    let collectibleItems = NextName.getCollectibleItemsInSet(setID: setID)!

    return collectibleItems
}