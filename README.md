# niftory-NextName-cadence

This repo contains the smart contracts, supporting transactions and scripts, and test suite for the NextName collectible experience, built on Flow.

The collectible structure is very similar to NBA Top Shot (and most card based collectibles), where collectibles will be minted in varying size runs, and belong to different setsover time. Some improvements and changes have been made to the Top Shot contract, including:

- Nomenclature changes (e.g. 'Play' -> 'CollectibleItem')
- Small quality of life improvements, like named paths
- Data access improvements based off of Josh Hannan's "What I’ve learned since Top Shot" Cadence blogs
- Additional contract defined metadata at the Set, and CollectibleItem level

The official flow-js-testing library has been used for the creation of the test suite.

Much thanks to all the Dapper resouces and Discord help used in the adaptation of this contract!

| :exclamation: This project last tested on Flow CLI v0.28.2 |
| ---------------------------------------------------------- |

## Running the tests

To run the tests, yarn and the Flow CLI must be installed.

    npm install --global yarn

    brew install flow-cli

Once installed, from the root of the project:

1. Install all dependencies:

   ```
   yarn install
   ```

2. Set up your flow.json and .env, following the template from example.flow.json and env.example.

3. Make the test shell script executable:

   ```
   chmod +x tests.sh
   ```

4. Run the 'test' shell script; this starts the flow emulator, deploys contracts, runs all tests, then cleans up the emulator:

| :exclamation: The test framework has changed signficantly, and these need to be updated! |
| ---------------------------------------------------------------------------------------- |

    ```
    ./tests.sh
    ```

## Getting started with Testnet

1. Generate a key pair with the Flow CLI:

   ```
   flow keys generate
   ```

   | :zap: Make sure to save these keys in a safe place, you'll need them later. |
   | --------------------------------------------------------------------------- |

2. Go to the Flow Testnet Faucet to create a new testnet account. Use the public key from the previous step.

3. Set up your flow.json file, per the example.flow.json in the root directory.

You're now setup to run any desired commands against testnet.

## Common commands

See `flow-cli-emulator.sh` for `flow-cli-testnet.sh` common commands.
