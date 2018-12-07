//
//  YSViewControllerTransitionManager.swift
//  YSSwiftTransitionDemo
//
//  Created by 葛燕生 on 2018/11/9.
//  Copyright © 2018 葛燕生. All rights reserved.
//

import UIKit

class YSViewControllerTransitionManager: NSObject, UIViewControllerTransitioningDelegate {
  var presentTransition: YSPresentTransition = YSPresentTransition()
  var dismissTransition: YSDismissTransition = YSDismissTransition()
  var interactionController: YSSwipeBackInteractionController = YSSwipeBackInteractionController()
  override init() {
    super.init()
    let context: YSGestureTransitionBackContext = YSGestureTransitionBackContext()
    dismissTransition.context = context
  }
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return dismissTransition
  }
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return presentTransition
  }
  func wireToViewController(viewController: UIViewController) {
    interactionController.wireToViewController(viewController: viewController)
  }
//  func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//    
//  }

}
