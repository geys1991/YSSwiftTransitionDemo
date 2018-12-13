//
//  YSThreeStepViewController.swift
//  YSSwiftTransitionDemo
//
//  Created by 葛燕生 on 2018/12/13.
//  Copyright © 2018 YS_iOS. All rights reserved.
//

import UIKit

class YSThreeStepViewController: UIViewController,YSSwipeBackInteractionControllerDelegate {
  
  var flag: Bool = true
  deinit {
    print("YSThreeStepViewController deinit")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.red
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "loginBackButton"), style: .plain, target: self, action: #selector(backButtonOperation(backButton:)))
    
    let btn: UIButton = UIButton(frame: CGRect(x: 50, y: 200, width: 200, height: 50))
    btn.setTitle("click ===>>>", for: .normal)
    btn.setTitleColor(UIColor.black, for: .normal)
    btn.addTarget(self, action: #selector(click), for: .touchUpInside)
    view.addSubview(btn)
    
    let btn1: UIButton = UIButton(frame: CGRect(x: 50, y: 300, width: 200, height: 50))
    btn1.setTitle("comfirm", for: .normal)
    btn1.setTitleColor(UIColor.black, for: .normal)
    btn1.addTarget(self, action: #selector(click1), for: .touchUpInside)
    view.addSubview(btn1)
  }
  
  @objc func click() {

  }
  
  @objc func click1() {
    flag = false
  }
  
  override func backButtonOperation(backButton: Any?) {
    if flag {
      YSTransitionManager.instance.dismissModalViewController(animated: true) {
        print("\(self.flag)")
      }
    } else {
      YSTransitionManager.instance.dismissToClazz(clazzName: ViewController.self, animated: true) {
        print("\(self.flag)")
      }
    }
  }
  
  // MARK: YSSwipeBackInteractionControllerDelegate
  
  func disableBackGesture() -> Bool {
    return flag
  }
}
