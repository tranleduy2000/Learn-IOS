//
//  AppDelegate.swift
//  LearnNib
//
//  Created by duy on 11/6/18.
//  Copyright © 2018 duy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let attr = "Sample"
        let extractedExpr: SampleViewController = SampleViewController(attr: attr)
        let sampleViewController = extractedExpr
        window?.rootViewController = sampleViewController;
        window?.makeKeyAndVisible();
        
        
        return true;
    }

}

