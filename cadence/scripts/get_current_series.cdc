import NextName from "../contracts/NextName.cdc"

// This script reads the current Series from the NextName contract and 
// returns that number to the caller

// Returns: NextName.Series
// The Current Series struct in the NextName contract

pub fun main(): NextName.CurrSeriesData {
    let currSeries = NextName.CurrSeriesData()
    return currSeries
}