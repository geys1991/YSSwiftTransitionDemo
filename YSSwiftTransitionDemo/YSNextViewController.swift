//
//  YSNextViewController.swift
//  YSSwiftTransitionDemo
//
//  Created by 葛燕生 on 2018/12/7.
//  Copyright © 2018 YS_iOS. All rights reserved.
//

import UIKit

class YSNextViewController: UIViewController, YSSwipeBackInteractionControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = UIColor.blue
    }
  
  override func backButtonOperation(backButton: Any?) {
    navigationController?.dismiss(animated: true, completion: nil)
  }
  
  
//  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//    navigationController?.dismiss(animated: true, completion: nil)
//  }

}
