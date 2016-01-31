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
    
    var sourceArray = [String]()
    var displayArray = [String]()
    //    var displayDictionary:Dictionary = Dictionary<String, String>()
    
    let textCellIdentifier = "mainTableCellidentifier"
    let russianPlistFileName = "russianAlphabet"
    let serbianPlistFileName = "serbianAlphabet"
    let tableViewNumberOfSections: Int = 1
    let tableViewCellHeight: CGFloat = 50.0
    let tableViewHeaderHeight: CGFloat = 0.01
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.readPlistToDictionary(russianPlistFileName)
        //        self.readPlistToDictionary(serbianPlistFileName)
    }
    
    // MARK: TableView DataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return tableViewNumberOfSections
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = displayArray[indexPath.row]
        cell.detailTextLabel?.text = displayArray[indexPath.row]
        
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
        if searchText.characters.count == 0 {
            displayArray.removeAll()
            displayArray = displayArray + sourceArray
        } else {
            displayArray.removeAll()
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
    
    func readPlistToDictionary(plistType: String) -> Void {
        
        let rootPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, .UserDomainMask, true)[0]
        let plistPathInDocument = rootPath.stringByAppendingString("/\(plistType).plist")
        let data: NSData = NSData(contentsOfFile: plistPathInDocument)!
        let dictionary:NSDictionary = NSKeyedUnarchiver.unarchiveObjectWithData(data)! as! NSDictionary
        
        if !NSFileManager.defaultManager().fileExistsAtPath(plistPathInDocument){
            //            let plistPathInBundle : String = NSBundle.mainBundle().pathForResource(plistType, ofType: "plist") as String!
            //            self.displayDictionary = NSMutableDictionary(contentsOfFile: plistPathInBundle)
        }
    }
}


