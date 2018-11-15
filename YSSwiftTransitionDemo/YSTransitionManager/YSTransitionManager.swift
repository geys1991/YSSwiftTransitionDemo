//
//  YSTransitionManager.swift
//  YSSwiftTransitionDemo
//
//  Created by 葛燕生 on 2018/11/6.
//  Copyright © 2018 葛燕生. All rights reserved.
//

import UIKit

fileprivate let kAnimatedKey = "animated"
fileprivate let kReverseKey = "reverse"
fileprivate let kCompletionKey = "completion"
fileprivate let kViewControllerKey = "viewController"

class YSTransitionManager: NSObject {

  static let instance:YSTransitionManager = YSTransitionManager ()
  var tabbarController : UIViewController?

  // MARK: public methods
  
  func presentTargetVC(target targetVC: UIViewController!,
                       animate animated: Bool,
                       reve reverse : Bool,
                       complete: @escaping () -> Void) -> Void {
    if targetVC == nil {
      return
    }
    
    let completeBlock = complete
    let transitionParams : [String : Any] = [ kViewControllerKey : targetVC ,
                                              kReverseKey : reverse,
                                              kAnimatedKey : animated,
                                              kCompletionKey : completeBlock]
    self.YS_InternalPresentTargetVC(params: transitionParams)
  }
  
  func topViewController() -> UIViewController {
    
    var topViewController = self.tabbarController!
    while true {
      if topViewController.presentedViewController == nil {
        break
      }
      topViewController = topViewController.presentedViewController!
    }
    
    return topViewController
  }
  
  // MARK: public methods
  
  private func YS_InternalPresentTargetVC(params : [String : Any])-> Void {
    
    let targetVC = params[kViewControllerKey]
    let reverseFlag = params[kReverseKey]
    let animatedFlag = params[kAnimatedKey]
    let completeBlock = params[kCompletionKey]

    let topViewController = self.topViewController()
    
  }
}
