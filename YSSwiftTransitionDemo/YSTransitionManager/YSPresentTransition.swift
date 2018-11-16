//
//  YSPresentTransition.swift
//  YSSwiftTransitionDemo
//
//  Created by 葛燕生 on 2018/11/14.
//  Copyright © 2018 葛燕生. All rights reserved.
//

import UIKit

class YSPresentTransition: NSObject {

  let animationDuration: TimeInterval?
  var revers: Bool = false
  override init() {
    animationDuration = 0.3
  }
  func transitionDuration(transitonContext: UIViewControllerContextTransitioning) -> TimeInterval {
    return animationDuration!
  }
  func animatedTransition(transitionContext: UIViewControllerContextTransitioning) {
    let toViewController: UIViewController? = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
    let fromViewController: UIViewController? = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
    guard let toVC = toViewController, let fromVC = fromViewController else {
      return
    }
    let finalFrame: CGRect = transitionContext.finalFrame(for: toVC)
    let containerView: UIView = transitionContext.containerView
    let screenBounds: CGRect = UIScreen.main.bounds
    let captureView: UIView = toVC.view
    // MARK: factor ???
    let factor: CGFloat = self.revers ? -1 : 1
    captureView.frame = CGRect(origin: finalFrame.origin, size: CGSize(width: factor * screenBounds.size.width, height: 0))
    containerView.addSubview(captureView)

    let durationTime: TimeInterval = self.transitionDuration(transitonContext: transitionContext)
    UIView.animate(withDuration: durationTime,
                   delay: 0.0,
                   options: [.curveEaseInOut, .overrideInheritedOptions],
                   animations: {
                    let fromeFrame: CGRect = fromVC.view.frame
                    fromVC.view.frame = fromeFrame.offsetBy(dx: fromeFrame.size.width / 3 * factor, dy: 0)
    }, completion: { _ in
      transitionContext.completeTransition(true)
    })
  }
}
