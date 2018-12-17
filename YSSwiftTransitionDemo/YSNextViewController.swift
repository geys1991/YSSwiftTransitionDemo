//
//  YSNextViewController.swift
//  YSSwiftTransitionDemo
//
//  Created by 葛燕生 on 2018/12/7.
//  Copyright © 2018 YS_iOS. All rights reserved.
//

import UIKit
import YSTransitionManager

class YSNextViewController: UIViewController, YSSwipeBackInteractionControllerDelegate {
  
  deinit {
    print("YSNextViewController deinit")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.blue
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "loginBackButton"), style: .plain, target: self, action: #selector(backButtonOperation(backButton:)))
    
    let btn: UIButton = UIButton(frame: CGRect(x: 50, y: 200, width: 200, height: 50))
    btn.setTitle("click ===>>>", for: .normal)
    btn.setTitleColor(UIColor.black, for: .normal)
    btn.addTarget(self, action: #selector(click), for: .touchUpInside)
    view.addSubview(btn)
  }
  
  override func backButtonOperation(backButton: Any?) {
    YSTransitionManager.instance.dismissModalViewController(animated: true) {
      print("YSNextViewController dismiss")
    }
  }
  
  @objc func click() {
    let targetVC: YSThreeStepViewController = YSThreeStepViewController()
    targetVC.title = "YSThreeStepViewController"
    let navi: UINavigationController = UINavigationController(rootViewController: targetVC)
    YSTransitionManager.instance.presentTargetVC(target: navi, animate: true, reve: false) {
      // end operation
    }
  }
}
