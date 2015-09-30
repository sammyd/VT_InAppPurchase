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
import StoreKit

class AdContainerViewController: UIViewController, DataStoreOwner, IAPContainer {
  
  @IBOutlet weak var adView: UIView!
  @IBOutlet weak var containerView: UIView!
  
  var dataStore: DataStore? {
    didSet {
      passDataStoreToChildren()
    }
  }
  var iapHelper: IAPHelper? {
    didSet {
      updateIAPHelper()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    passDataStoreToChildren()
    passIAPHelperToChildren()
  }
}

extension AdContainerViewController {
  
  @IBAction func handleRemoveAdsPressed(sender: AnyObject) {
    // TODO: Write implementation
  }
  
  private func setAdsAsRemoved(removed: Bool, animated: Bool = true) {
    dispatch_async(dispatch_get_main_queue()) {
      if animated {
        UIView.animateWithDuration(0.7) {
          self.adView.hidden = removed
        }
      } else {
        self.adView.hidden = removed
      }
    }
  }
  
  private func updateIAPHelper() {
    passIAPHelperToChildren()
    
    guard let iapHelper = iapHelper else { return }
    
    // TODO: complete this implementation
  }
  
}
