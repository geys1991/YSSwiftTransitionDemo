//
//  YSTransitionManager.swift
//  YSSwiftTransitionDemo
//
//  Created by 葛燕生 on 2018/11/6.
//  Copyright © 2018 葛燕生. All rights reserved.
//

import UIKit
import YYKit

private let kAnimatedKey = "animated"
private let kReverseKey = "reverse"
private let kCompletionKey = "completion"
private let kViewControllerKey = "viewController"
private var kTransition = "transition"

class YSTransitionManager: NSObject {

  static let instance: YSTransitionManager = YSTransitionManager ()
  var tabbarController: UIViewController?
  var topSnapShotView: UIView?
  // MARK: public methods
  func presentTargetVC(target targetVC: UIViewController!,
                       animate animated: Bool,
                       reve reverse: Bool,
                       complete: @escaping () -> Void) {
    if targetVC == nil {
      return
    }
    let completeBlock = complete
    let transitionParams: [String: Any] = [ kViewControllerKey: targetVC ,
                                              kReverseKey: reverse,
                                              kAnimatedKey: animated,
                                              kCompletionKey: completeBlock]
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
  private func YS_InternalPresentTargetVC(params: [String: Any]) {
    guard let targetViewController = params[kViewControllerKey] as? UIViewController else {
      return
    }
    var reverse: Bool = false
    if let reverseFlag = params[kReverseKey] as? Bool {
      reverse = reverseFlag
    }
    var animated: Bool = false
    if let animatedFlag = params[kAnimatedKey] as? Bool {
      animated = animatedFlag
    }
    var completeBlock: () -> Void = {
      
    }
    if let complete = params[kCompletionKey] as? () -> Void {
      completeBlock = complete
    }
    let topViewController = self.topViewController()
    let transitionManager: YSViewControllerTransitionManager = YSViewControllerTransitionManager()
    transitionManager.dismissTransition.revers = true
    transitionManager.presentTransition.revers = true
    
    targetViewController.transitioningDelegate = transitionManager
    objc_setAssociatedObject(targetViewController, &kTransition, transitionManager, .OBJC_ASSOCIATION_RETAIN)
    if !topViewController.isBeingDismissed && !topViewController.isBeingPresented {
      topViewController.present(targetViewController, animated: animated) {
        transitionManager.wireToViewController(viewController: targetViewController)
        completeBlock()
      }
    }

  }
  func snapShotTopView(vcToDismiss: UIViewController) {
    var topViewController = self.topViewController()
    if let topVC = topViewController.navigationController {
      topViewController = topVC
    }
    let topView: UIView = UIImageView(image: topViewController.view.snapshotImage(afterScreenUpdates: true))
    self.topSnapShotView = topView
    if vcToDismiss.navigationController != nil {
      vcToDismiss.navigationController?.view.addSubview(topView)
    } else {
      vcToDismiss.view.addSubview(topView)
    }
  }
}
