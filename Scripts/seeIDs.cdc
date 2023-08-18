import CryptoPoops from 0x01
import NonFungibleToken from 0x02

pub fun main(account: Address): [UInt64]{
    let publicReference = getAccount(account).getCapability(/public/Collection)
                            .borrow<&CryptoPoops.Collection{CryptoPoops.CollectionPublic}>()
                            ?? panic("Does not have a Collection. Create a collection first")

    return publicReference.getIDs()
}