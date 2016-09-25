//
//  AlphabetViewController.swift
//  CDVDictionary
//
//  Created by Alex Golub on 9/25/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import UIKit

class AlphabetViewController: UIViewController {
    @IBOutlet weak var alphabetTableView: UITableView!

    var navigationTitle: String!
    var dictionaryName: String!
    fileprivate var sourceArray = [String]()
    fileprivate var displayDictionary: Dictionary = [String: String]()
    fileprivate let alphabetTableViewNumberOfSections: Int = 1
    fileprivate let alphabetTableViewCellHeight: CGFloat = 56.0
    fileprivate let alphabetTableViewHeaderFooterHeight: CGFloat = 0.01
    fileprivate let alphabetCellIdentifier = "alphabetCell"
    fileprivate let colors = Colors()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData(plistName: dictionaryName)
        setupNavigationBar()
        setupTableView()
    }
}

extension AlphabetViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return alphabetTableViewNumberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourceArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: alphabetCellIdentifier, for: indexPath) as! DictionaryCell
        let letter = sourceArray[indexPath.row]
        cell.wordLabel?.text = letter
        cell.translationLabel?.text = displayDictionary[letter]
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = colors.cellYellowColor()
        } else {
            cell.backgroundColor = colors.cellWhiteColor()
        }
        return cell
    }
}

extension AlphabetViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return alphabetTableViewHeaderFooterHeight
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return alphabetTableViewHeaderFooterHeight
    }
}

extension AlphabetViewController {
    // MARK: Utils
    fileprivate func setupData(plistName: String) {
        guard let data = PlistReaderUtils().read(plistName) else {
            return
        }
        sourceArray = data.sourceArray
        displayDictionary = data.displayDictionary
        alphabetTableView.reloadData()
    }

    fileprivate func setupTableView() {
        alphabetTableView.rowHeight = UITableViewAutomaticDimension
        alphabetTableView.estimatedRowHeight = alphabetTableViewCellHeight
    }

    fileprivate func setupNavigationBar() {
        NavigationBarStyleUtils().style(navigationBar: (navigationController?.navigationBar)!)
        title = navigationTitle
    }
}
