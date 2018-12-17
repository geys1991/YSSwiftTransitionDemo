//
//  AppDelegate.swift
//  YSSwiftTransitionDemo
//
//  Created by 葛燕生 on 2018/11/6.
//  Copyright © 2018 葛燕生. All rights reserved.
//

import UIKit
import YSTransitionManager

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    let rootVC: ViewController = ViewController()
    let nav: UINavigationController = UINavigationController(rootViewController: rootVC)
    YSTransitionManager.instance.tabbarController = nav
    window?.rootViewController = nav
    window?.makeKeyAndVisible()
    return true
  }
}
