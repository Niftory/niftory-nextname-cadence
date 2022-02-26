import NextName from "../contracts/NextName.cdc"

// This script reads the Series of the specified set and returns it

// Parameters:
//
// setID: The unique ID for the set whose data needs to be read

// Returns: NextName.Series
// The Series struct

pub fun main(setID: UInt32): NextName.Series {
    return NextName.SetData(setID: setID).series
}