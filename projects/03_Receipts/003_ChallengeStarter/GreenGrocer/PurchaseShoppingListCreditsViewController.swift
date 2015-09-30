/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

class PurchaseShoppingListCreditsViewController: UIViewController, IAPContainer, DataStoreOwner {
  
  
  @IBOutlet var offerLabels: [UILabel]!
  @IBOutlet var buyButtons: [UIButton]!
  
  var purchaseCompletedOrCancelled: (() -> ())?
  var iapHelper: IAPHelper? {
    didSet {
      if let iapHelper = iapHelper {
        availableProducts = extractAvailableProducts(iapHelper)
      }
      prepareContent()
    }
  }
  var dataStore: DataStore?
  
  private var availableProducts = [SKProduct]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    prepareContent()
  }
  
  
  @IBAction func handleBuyPressed(sender: UIButton) {
    // TODO: Buy the product
    finishWithPurchaseVC()
  }
  
  
  @IBAction func handleCancelPressed(sender: AnyObject) {
    finishWithPurchaseVC()
  }
}


extension PurchaseShoppingListCreditsViewController {
  
  private func extractAvailableProducts(helper: IAPHelper) -> [SKProduct] {
    // Get hold of the ones available to buy
    let shoppingListProductIds = [
      GreenGrocerPurchase.NewShoppingLists_One,
      GreenGrocerPurchase.NewShoppingLists_Five,
      GreenGrocerPurchase.NewShoppingLists_Ten
      ].map { $0.productId }
    
    // TODO: Find the correct products
    return [SKProduct]()
  }
  
  private func prepareContent() {
    // Check we have the correct number of items
    if availableProducts.count != offerLabels?.count
      || availableProducts.count != buyButtons?.count { return }
    
    // TODO: Update the labels to display the products
  }
  
  private func finishWithPurchaseVC() {
    NSNotificationCenter.defaultCenter().removeObserver(self)
    purchaseCompletedOrCancelled?()
  }
}

