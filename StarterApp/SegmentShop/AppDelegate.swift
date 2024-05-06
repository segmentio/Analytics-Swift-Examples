//
//  AppDelegate.swift
//  SegmentShop
//
//  Created by Alan Charles on 1/11/24.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate, UINavigationControllerDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        if let navController = window!.rootViewController as? UINavigationController {
            navController.delegate = self
        }
                return true
    }
}
