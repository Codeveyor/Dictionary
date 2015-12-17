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
    
    var displayArray = ["a", "b", "c"]
    
    let textCellIdentifier = "mainTableCellidentifier"
    let tableViewNumberOfSections:Int = 1
    let tableViewCellHeight: CGFloat = 50.0
    let tableViewHeaderHeight: CGFloat = 0.01
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

