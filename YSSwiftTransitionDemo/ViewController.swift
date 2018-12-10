//
//  ViewController.swift
//  YSSwiftTransitionDemo
//
//  Created by 葛燕生 on 2018/11/6.
//  Copyright © 2018 葛燕生. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor.white
    
    let btn: UIButton = UIButton(frame: CGRect(x: 50, y: 200, width: 100, height: 50))
    btn.setTitle("click", for: .normal)
    btn.setTitleColor(UIColor.black, for: .normal)
    btn.addTarget(self, action: #selector(click), for: .touchUpInside)
    view.addSubview(btn)
  }
  @objc func click() {
    let targetVC: YSNextViewController = YSNextViewController()
    targetVC.title = "next"
    let navi: UINavigationController = UINavigationController(rootViewController: targetVC)
    YSTransitionManager.instance.presentTargetVC(target: navi, animate: true, reve: false) {
      // end operation
    }
  }
}
