import CryptoPoops from 0x01
import NonFungibleToken from 0x02

transaction(recipient: Address,name: String, favouriteFood: String,luckyNumber: Int) {

  prepare(acct: AuthAccount) {
    let minter =  acct.borrow<&CryptoPoops.Minter>(from: /storage/Minter)!

   let pubRef = getAccount(recipient).getCapability(/public/Collection)
                        .borrow<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic}>()
                         ?? panic("Does not have a Collection. Create a collection first")
  
    pubRef.deposit(token: <- minter.createNFT(name: name, favouriteFood: favouriteFood, luckyNumber: luckyNumber))
  }

  execute {
    log("Deposit Complete")
  }
}
