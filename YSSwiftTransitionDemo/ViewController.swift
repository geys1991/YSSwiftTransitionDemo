//
//  ViewController.swift
//  YSSwiftTransitionDemo
//
//  Created by 葛燕生 on 2018/11/6.
//  Copyright © 2018 葛燕生. All rights reserved.
//

import UIKit

class ViewController: UIViewController, YSSwipeBackInteractionControllerDelegate {
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor.white
    
    let btn: UIButton = UIButton(frame: CGRect(x: 50, y: 200, width: 200, height: 50))
    btn.setTitle("click ===>>>", for: .normal)
    btn.setTitleColor(UIColor.black, for: .normal)
    btn.addTarget(self, action: #selector(click), for: .touchUpInside)
    view.addSubview(btn)
    
    let btn1: UIButton = UIButton(frame: CGRect(x: 50, y: 300, width: 200, height: 50))
    btn1.setTitle("<<<=== click", for: .normal)
    btn1.setTitleColor(UIColor.black, for: .normal)
    btn1.addTarget(self, action: #selector(clickReverse), for: .touchUpInside)
    view.addSubview(btn1)
  }

  @objc func click() {
    let targetVC: YSNextViewController = YSNextViewController()
    let navi: UINavigationController = UINavigationController(rootViewController: targetVC)
    YSTransitionManager.instance.presentTargetVC(target: navi, animate: true, reve: false) {
      // end operation
    }
  }
  
  @objc func clickReverse() {
    let targetVC: YSNextViewController = YSNextViewController()
    targetVC.title = "next"
    let navi: UINavigationController = UINavigationController(rootViewController: targetVC)
    YSTransitionManager.instance.presentTargetVC(target: navi, animate: true, reve: true) {
      // end operation
    }
  }
  
}
