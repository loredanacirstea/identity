
# The Singular Object

In the Inter-Chain environment this pattern will become prevalent. In the following a demo of its use is sketched.

## Steps

1. Deploy necessay contracts on the chosen set of chains with nBridge
2. Connect to one of the chains (or all of them if using ganas wallet)
3. Create Singular identities
  1. Demonstrate that no duplicates can be created on the same chain nor on other chains
4. Add proofs and features to Singular identities


<showFeature:(react-div {} (list 
  (react-Contract {
      "name" "Feature1"
      "function" "isInstance"
  })
  (react-Contract {
      "name" "Feature1"
      "function" "insert"
  })
  (react-Contract {
      "name" "Feature1"
      "function" "remove"
  })
  (react-Contract {
      "name" "Feature1"
      "function" "get"
  })
  (react-Contract {
      "name" "Feature1"
      "function" "count"
  })
  (react-Contract {
      "name" "Feature1"
      "function" "getAtIndex"
  })
    (react-Contract {
      "name" "Feature1"
      "function" "getKeyAtIndex"
  })
))>

## Proofs

<showProof:(react-div {} (list 
  (react-Contract {
      "name" "Proof1"
      "function" "isInstance"
  })
  (react-Contract {
      "name" "Proof1"
      "function" "insert"
  })
  (react-Contract {
      "name" "Proof1"
      "function" "remove"
  })
  (react-Contract {
      "name" "Proof1"
      "function" "get"
  })
  (react-Contract {
      "name" "Proof1"
      "function" "count"
  })
  (react-Contract {
      "name" "Proof1"
      "function" "getAtIndex"
  })
    (react-Contract {
      "name" "Proof1"
      "function" "getKeyAtIndex"
  })
))>