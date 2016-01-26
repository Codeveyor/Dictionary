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


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
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
    
    func copyPlistFiles()
    {
        let directoryPaths =  NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)
        let docsDir = directoryPaths[0] 
        var error:NSError?
        let destinationPath = (docsDir as NSString).stringByAppendingPathComponent("/russianAlphabet.plist")
        
        var fileManager = NSFileManager.defaultManager()
        
        if let path = NSBundle.mainBundle().pathForResource("russianAlphabet", ofType:"plist") {
            print(path)
            if fileManager.copyItemAtPath(path, toPath: destinationPath) == true {
                print("success")
            }
            else {
                print("failed, it's already there")
                print(error?.localizedDescription)
            }
        }
        
        if let files = fileManager.contentsOfDirectoryAtPath(docsDir)
        {
            for filename in files{
                print(filename)
            }
        }
    }
}

