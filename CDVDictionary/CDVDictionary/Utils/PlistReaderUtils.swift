//
//  PlistReaderUtils.swift
//  CDVDictionary
//
//  Created by Alex Golub on 9/25/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import Foundation

class PlistReaderUtils: NSObject {
    fileprivate let plistExtension = ".plist"

    func read(_ plistName: String) -> (sourceArray: [String], displayDictionary: [String : String])? {
        if let path = pathInTestBundle(forFileWithName: plistName) {
            let displayDictionary = NSDictionary(contentsOfFile: path) as! [String: String]
            var sourceArray = [String]()
            sourceArray.append(contentsOf: displayDictionary.keys)
            sourceArray.sort { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }
            return (sourceArray, displayDictionary)
        }
        return nil
    }

    fileprivate func pathInTestBundle(forFileWithName name: String) -> String? {
        let bundle = Bundle(for:object_getClass(self)!)
        let safePath = bundle.path(forResource: name, ofType: plistExtension)
        return safePath
    }
}
