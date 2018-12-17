//
//  YSInfoModel.swift
//  YSSwiftTransitionDemo
//
//  Created by 葛燕生 on 2018/12/13.
//  Copyright © 2018 YS_iOS. All rights reserved.
//

import UIKit
import YSTransitionManager

class YSInfoModel: NSObject {
  var count: Int {
    didSet {
      if self.count == 2 {
        let targetVC: YSNextViewController = YSNextViewController()
        let navi: UINavigationController = UINavigationController(rootViewController: targetVC)
        YSTransitionManager.instance.presentTargetVC(target: navi, animate: true, reve: false) {
          self.count = 0
        }
      }
    }
  }
  
  override init() {
    count = 0
  }

}
