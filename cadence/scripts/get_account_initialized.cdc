import NextName from "../contracts/NextName.cdc"

pub fun main(address: Address): Bool {

    return getAccount(address)
        .getCapability<&{NextName.NextNameCollectionPublic}>(NextName.CollectionPublicPath)
        .check()
}