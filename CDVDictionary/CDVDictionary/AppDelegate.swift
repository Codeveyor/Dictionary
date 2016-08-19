//
//  AppDelegate.swift
//  CDVDictionary
//
//  Created by Alex Golub on 12/17/15.
//  Copyright © 2015 Alex Golub. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions
                   launchOptions: [NSObject: AnyObject]?) -> Bool {
        copyPlistFiles()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
    }

    func applicationDidBecomeActive(application: UIApplication) {
    }

    func applicationWillTerminate(application: UIApplication) {
    }
    
    func copyPlistFiles() {
        
        let bundlePath = NSBundle.mainBundle().pathForResource("russianAlphabet", ofType: ".plist")
//        print(bundlePath, "\n") //prints the correct path
        let destinationPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
        let fileManager = NSFileManager.defaultManager()
        let fullDestinationPath = NSURL(fileURLWithPath: destinationPath).URLByAppendingPathComponent("russianAlphabet.plist")
        let fullDestinationPathString = fullDestinationPath.path
//        print(fileManager.fileExistsAtPath(bundlePath!)) // prints true

        do {
            try fileManager.copyItemAtPath(bundlePath!, toPath: fullDestinationPathString!)
        } catch {
            print("\n")
            print(error)
        }
    }
}


