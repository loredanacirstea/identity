# The Singular Object Pattern

The Singular Object will soon become a widely-used software pattern for the Inter-Chain environment.

## Usecases

- Identity
    - reputation management
    - dispute resolution
    - proof management (this present dapp)
    - digital properties management
- New generation NFTs (Inter-Chain ERC721)
- New generation currency (Inter-Chain ERC20)
- [The Singularity](https://youtu.be/jsiDviYMvMc) type of DAOs (that do remote governance)
- The new (inter-chain) digital politics and political groups
- governance contracts

## Characteristics

![](https://i.imgur.com/i3iAUir.png)



- the root information (most (or all) of the mirrored part) has all the characteristics of identity
- has at least 1 defining ID. Present implementation has 2.
- containes a mirrored part (across all participating blockchains) and a sharded part (isolated to each blockchain)
- singularity is guaranteed (duplicates are not created)
- graph-linking between singular objects is encouraged by design
- multiple points of entry for search and navigation
- flexibility of linking to extant or new information
- modularity
    - self-like-centric (can link/unlink in various ways with objects of the same nature)
    - chain-centric
    - contract-centric
- searchability
- carefully-controlled accessability (with transparency encouraged selectively)
- mutually-controlled mutability


## Present Implementation



![](https://i.imgur.com/2goD2hu.jpg)




- data mirroring is executed using the nBridge multi-chain IBC tech for nickname and root EVM address of each singular object
- singularity is checked locally (on each chain) and it remains the main reason behind mirroring
- uses standard Solidity encodings (extensible by most developers)
- uses the mobile ganas wallet that may facilitate dynamic chain connections
- uses the marks factory for easy prototyping and sharing dapps and dapp information from mobile to mobile

## Components

3 Contracts that keep data of respective types: SingularContract, ProofContract, FeatureContract.
The SingularContract has 2 members that are mirrored by the nBridge across 3 blockchains and they represent the "spine" of the Singular Object.
The ProofContract holds proofs that are files on IPFS. Intended for photo, video, audio captures. While FeaturesContract collects information supposedly proven by the proof media.
Example: If the proof is a photo of my passport, a feature may be the whole name (in the form: label: whole name, value: Loredana Cirstea).

## Future

The singular object pattern is one of the important innovations implemented into the future dTypeDB inter-chain database proposed to Ethereum 2.0 (as a Master Shard as far back as 2019) [link](https://ethresear.ch/t/a-master-shard-to-account-for-ethereum-2-0-global-scope/5730) and then Evmos [link](https://commonwealth.im/evmos/discussion/4980-dtypedb-the-first-interchain-database).

- implementation directly in the EVM assembly for gas economy
- implementation in CosmWasm (and possibly Cosmos SDK Go module) for object homogeneity across engines. 
 
## One More Thing

Any CosmWasm chain interested to collaborate on dTypeDB and nBridge? Maybe the Inter-Chain Foundation?



