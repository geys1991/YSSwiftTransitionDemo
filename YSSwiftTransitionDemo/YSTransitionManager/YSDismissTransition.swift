//
//  YSDismissTransition.swift
//  YSSwiftTransitionDemo
//
//  Created by 葛燕生 on 2018/11/14.
//  Copyright © 2018 葛燕生. All rights reserved.
//

import UIKit

class YSDismissTransition: NSObject {
  
  var revers: Bool = false
  let animationDuration: TimeInterval?
  var transitionContext: UIViewControllerContextTransitioning?
  
  override init() {
    animationDuration = 0.3
  }
  
  func gesturefinish() -> Void {
    if let transitionTemp = self.transitionContext {
      transitionTemp.completeTransition(transitionTemp.transitionWasCancelled)
    }
  }
  
  func transitionDuration(transitonContext: UIViewControllerContextTransitioning) -> TimeInterval {
    return animationDuration!
  }
  
  func animateTrtansition(transitionContext: UIViewControllerContextTransitioning?) -> Void {
    
    guard let transitionTemp = transitionContext else {
      return
    }
    
    let toViewController: UIViewController = transitionTemp.viewController(forKey: UITransitionContextViewControllerKey.to)!
    let fromViewController: UIViewController = transitionTemp.viewController(forKey: UITransitionContextViewControllerKey.from)!
    
    
    
    
  }
  

}
