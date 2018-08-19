//
//  PlistReaderUtils.swift
//  CDVDictionary
//
//  Created by Alex Golub on 9/25/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import Foundation

class PlistReaderUtils {

    func read(_ plistName: String) -> (sourceArray: [String], displayDictionary: [String : String])? {
        if let path = pathInTestBundle(forFileWithName: plistName) {
            guard let displayDictionary = NSDictionary(contentsOfFile: path) as? [String: String] else {
                fatalError("ERROR! Unable to get contents of file")
            }

            var sourceArray = [String]()
            sourceArray.append(contentsOf: displayDictionary.keys)
            sourceArray.sort { $0.localizedCaseInsensitiveCompare($1) == .orderedAscending }

            return (sourceArray, displayDictionary)
        }

        return nil
    }

    private func pathInTestBundle(forFileWithName name: String) -> String? {
        guard let selfClass = object_getClass(self) else {
            fatalError("ERROR! Unable to get PlistReaderUtils reference")
        }

        let bundle = Bundle(for: selfClass)
        let safePath = bundle.path(forResource: name, ofType: ".plist")

        return safePath
    }
}
