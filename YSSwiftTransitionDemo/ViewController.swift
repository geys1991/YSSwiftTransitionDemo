//
//  ViewController.swift
//  YSSwiftTransitionDemo
//
//  Created by 葛燕生 on 2018/11/6.
//  Copyright © 2018 葛燕生. All rights reserved.
//

import UIKit

class ViewController: UIViewController, YSSwipeBackInteractionControllerDelegate {
  var info: YSInfoModel = YSInfoModel()
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
    
    let btn2: UIButton = UIButton(frame: CGRect(x: 50, y: 400, width: 200, height: 50))
    btn2.setTitle("CLICK + 1", for: .normal)
    btn2.setTitleColor(UIColor.black, for: .normal)
    btn2.addTarget(self, action: #selector(clickPlus1), for: .touchUpInside)
    view.addSubview(btn2)
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
  
  @objc func clickPlus1() {
    info.count = info.count + 1
  }

}
