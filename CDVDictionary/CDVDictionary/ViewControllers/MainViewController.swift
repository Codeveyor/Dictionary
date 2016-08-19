//
//  MainViewController.swift
//  CDVDictionary
//
//  Created by Alex Golub on 12/17/15.
//  Copyright © 2015 Alex Golub. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    private var sourceArray = [String]()
    private var displayArray = [String]()
    private var displayDictionary: Dictionary = [String: String]()
    private let textCellIdentifier = "mainTableCellidentifier"
    private let russianPlistFileName = "russianAlphabet"
    private let serbianPlistFileName = "serbianAlphabet"
    private let plistExtension = ".plist"
    private let tableViewNumberOfSections: Int = 1
    private let tableViewCellHeight: CGFloat = 50.0
    private let tableViewHeaderHeight: CGFloat = 0.01

    override func viewDidLoad() {
        super.viewDidLoad()
        self.readPlistToDictionary(russianPlistFileName)
    }

    // MARK: TableView DataSource

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return tableViewNumberOfSections
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayArray.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as! DictionaryCell
        let word = displayArray[indexPath.row]
        cell.wordLabel?.text = word
        cell.translationLabel?.text = displayDictionary[word]
        return cell
    }

    // MARK: TableView Delegate

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return tableViewCellHeight
    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableViewHeaderHeight
    }

    // MARK: SearchBar Delegate

    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        displayArray.removeAll()
        if searchText.characters.count == 0 {
            displayArray.appendContentsOf(sourceArray)
        } else {
            //            let predicate = NSPredicate(format: "SELF == %@", searchText)
            //            let searchResults = displayArray.filter({ (predicate) -> Bool in
            for key: String in sourceArray {
                let word = key as String
                if word.rangeOfString(key) != nil {
                    
                }
            }
        }
    }

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

    // MARK: Utils

    private func readPlistToDictionary(plistType: String) -> Void {
        if let path = pathInTestBundle(forFileWithName: plistType) {
            displayDictionary = NSDictionary(contentsOfFile: path) as! [String: String]
            sourceArray.appendContentsOf(displayDictionary.keys)
            sourceArray.sortInPlace { $0 < $1 }
            displayArray.appendContentsOf(sourceArray)
            tableView.reloadData()
        }
    }

    private func pathInTestBundle(forFileWithName name: String) -> String? {
        let bundle = NSBundle(forClass:object_getClass(self))
        let safePath = bundle.pathForResource(name, ofType: plistExtension)
        return safePath
    }
}
